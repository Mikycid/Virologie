def main():
    import subprocess

    def list_ad_users():
        try:
            # Retrieve the full domain name dynamically
            domain_command = [
                "powershell", "-Command",
                "[System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties().DomainName"
            ]
            domain_result = subprocess.run(
                domain_command, capture_output=True, text=True, check=True, creationflags=subprocess.CREATE_NO_WINDOW
            )
            domain = domain_result.stdout.strip()

            # PowerShell command to query only users using LDAP
            powershell_command = [
                "powershell", "-Command",
                f"""
                $domain = "LDAP://DC={domain.replace('.', ',DC=')}";
                $searcher = New-Object DirectoryServices.DirectorySearcher;
                $searcher.SearchRoot = New-Object DirectoryServices.DirectoryEntry($domain);
                # Filter only user accounts, exclude computer accounts
                $searcher.Filter = "(&(objectClass=user)(!(objectClass=computer)))";
                $searcher.PropertiesToLoad.Add("samAccountName") | Out-Null;
                $users = $searcher.FindAll();
                $users | ForEach-Object {{ $_.Properties['samAccountName'] }}
                """
            ]
            result = subprocess.run(
                powershell_command, capture_output=True, text=True, check=True, creationflags=subprocess.CREATE_NO_WINDOW
            )

            # Parse and return the users
            users = result.stdout.strip().split('\n')
            return users
        except subprocess.CalledProcessError as e:
            print(f"Error listing AD users: {e.stderr}")
            return []

    users = list_ad_users()
    if users:
        print(users)
    else:
        print("No users found or an error occurred.")

main()
