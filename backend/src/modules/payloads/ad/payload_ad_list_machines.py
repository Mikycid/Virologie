def main():
    import subprocess

    def list_machines_in_domain():
        try:
            # Retrieve the full domain name dynamically
            domain_command = [
                "powershell", "-Command",
                "[System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName"
            ]
            domain_result = subprocess.run(
                domain_command, capture_output=True, text=True, check=True
            )
            domain = domain_result.stdout.strip()

            # PowerShell command to query only machines using LDAP
            powershell_command = [
                "powershell", "-Command",
                f"""
                $domain = "LDAP://DC={domain.replace('.', ',DC=')}";
                $searcher = New-Object DirectoryServices.DirectorySearcher;
                $searcher.SearchRoot = New-Object DirectoryServices.DirectoryEntry($domain);
                # Filter only computer accounts
                $searcher.Filter = "(objectClass=computer)";
                $searcher.PropertiesToLoad.Add("name") | Out-Null;
                $machines = $searcher.FindAll();
                $machines | ForEach-Object {{ $_.Properties['name'] }}
                """
            ]
            result = subprocess.run(
                powershell_command, capture_output=True, text=True, check=True, creationflags=subprocess.CREATE_NO_WINDOW
            )

            # Parse and return the machines
            machines = result.stdout.strip().split('\n')
            return machines
        except subprocess.CalledProcessError as e:
            print(f"Error listing machines in domain: {e.stderr}")
            return []

    machines = list_machines_in_domain()
    if not machines:
        print("No machines found in the domain or failed to retrieve machines.")
        exit(1)

    print(machines)

main()
