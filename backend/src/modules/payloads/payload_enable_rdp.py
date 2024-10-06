import winreg as reg
import subprocess
import re

def enable_rdp():
    try:
        # Check if the Remote Desktop feature is already installed
        command = "Get-WindowsCapability -Online | Where-Object { $_.Name -like '*RemoteDesktop*' }"
        has_rdp = False
        try:
            result = subprocess.run(["powershell", "-Command", command], capture_output=True, text=True, check=True)

            if "NotPresent" not in result.stdout:
                has_rdp = True
        except subprocess.CalledProcessError as e:
            print(f"An error occurred: {e}")
            has_rdp = False
        
        if not has_rdp:
            print("Client does not have Remote Desktop feature installed.")
            return
        
        # Open the registry key for Remote Desktop settings
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, r"SYSTEM\CurrentControlSet\Control\Terminal Server", 0, reg.KEY_SET_VALUE)

        reg.SetValueEx(key, "fDenyTSConnections", 0, reg.REG_DWORD, 0)
        reg.CloseKey(key)

        # Check if the RDP firewall rule exists using the status code and regex
        rule_check = subprocess.run(
            ["netsh", "advfirewall", "firewall", "show", "rule", "name=RDP"],
            capture_output=True,
            text=True
        )

        # Use status code or regex pattern to verify rule existence
        if rule_check.returncode != 0 or not re.search(r'\bRDP\b', rule_check.stdout, re.IGNORECASE):
            print("RDP firewall rule does not exist or is not configured correctly. Creating a new rule...")
            # Add a new firewall rule to allow RDP connections
            subprocess.run([
                "netsh", "advfirewall", "firewall", "add", "rule",
                "name=RDP", "dir=in", "action=allow", "protocol=TCP", "localport=3389"
            ], check=True)
            print("RDP firewall rule created successfully.")

        # Enable the RDP firewall rule
        subprocess.run(["netsh", "advfirewall", "firewall", "set", "rule", "name=RDP", "new", "enable=yes"], check=True)

        

        print("RDP has been enabled.")
    except Exception as e:
        print(f"Failed to enable RDP: {e}")

# Call the function to enable RDP
enable_rdp()
