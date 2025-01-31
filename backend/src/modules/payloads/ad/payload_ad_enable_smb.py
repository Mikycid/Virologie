
def main():
    import subprocess

    def run_powershell(command):
        return subprocess.run(["powershell", "-Command", command], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW).stdout.strip()

    if "GpoId" not in run_powershell('Get-GPO -Name "Enable SMB Firewall Rules" -ErrorAction SilentlyContinue'):
        run_powershell('New-GPO -Name "Enable SMB Firewall Rules"')
    
    if "DistinguishedName" not in run_powershell("""Get-ADOrganizationalUnit -Filter "Name -eq 'Workstations'" """):
        run_powershell('New-ADOrganizationalUnit -Name "Workstations" -Path "DC=virology,DC=local"')
    
    run_powershell('''Get-ADComputer -Filter * | Where-Object { $_.DistinguishedName -like "CN=*,CN=Computers,DC=virology,DC=local" } | ForEach-Object { Move-ADObject -Identity $_.DistinguishedName -TargetPath "OU=Workstations,DC=virology,DC=local" }''')
    
    run_powershell('New-GPLink -Name "Enable SMB Firewall Rules" -Target "OU=Workstations,DC=virology,DC=local"')
    run_powershell('gpupdate /force')
    print("OK")

main()
