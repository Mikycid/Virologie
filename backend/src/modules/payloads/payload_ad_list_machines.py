

def main():
    import subprocess
    import os
    def list_machines_in_domain():
        try:
            ps_command = """
            Import-Module ActiveDirectory;
            Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
            """

            result = subprocess.run(
                ["powershell", "-Command", ps_command],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                shell=True
            )

            if result.returncode != 0:
                print(f"PowerShell error: {result.stderr}")
                return []

            machines = [line.strip() for line in result.stdout.splitlines() if line.strip()]
            return machines

        except Exception as e:
            print(f"Failed to list machines in domain: {e}")
            return []

    import sys
    executable_path = sys.argv[0]

    if not any(os.access(os.path.join(path, 'psexec.exe'), os.X_OK) for path in os.environ["PATH"].split(os.pathsep)):
        print("PsExec is not found in the system PATH. Please download and place it in the PATH.")
        exit(1)

    machines = list_machines_in_domain()
    if not machines:
        print("No machines found in the domain or failed to retrieve machines.")
        exit(1)

    print(f"Machines found in the domain: {machines}")

main()
