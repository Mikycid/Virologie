

def enable_rdp():
    import winreg as reg
    import subprocess
    import re
    try:
        key_path = r"SYSTEM\CurrentControlSet\Control\Terminal Server"
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, key_path, 0, reg.KEY_SET_VALUE)
        reg.SetValueEx(key, "fDenyTSConnections", 0, reg.REG_DWORD, 0)
        reg.CloseKey(key)

        print("Remote Desktop has been enabled.")

        key_path = r"SYSTEM\CurrentControlSet\Control\Terminal Server"
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, key_path, 0, reg.KEY_SET_VALUE)
        reg.SetValueEx(key, "fSingleSessionPerUser", 0, reg.REG_DWORD, 0)
        reg.CloseKey(key)

        policy_path = r"SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
        try:
            key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, policy_path, 0, reg.KEY_SET_VALUE)
        except FileNotFoundError:
            key = reg.CreateKey(reg.HKEY_LOCAL_MACHINE, policy_path)

        reg.SetValueEx(key, "fSingleSessionPerUser", 0, reg.REG_DWORD, 0)
        reg.SetValueEx(key, "fDenyTSConnections", 0, reg.REG_DWORD, 0)
        reg.SetValueEx(key, "MaxInstanceCount", 0, reg.REG_DWORD, 999)
        reg.CloseKey(key)

        print("Registry settings for multiple sessions have been configured.")

        rule_check = subprocess.run(
            ["netsh", "advfirewall", "firewall", "show", "rule", "name=RDP"],
            capture_output=True,
            text=True
        )

        if rule_check.returncode != 0 or not re.search(r'\bRDP\b', rule_check.stdout, re.IGNORECASE):
            print("RDP firewall rule does not exist or is not configured correctly. Creating a new rule...")
            subprocess.run([
                "netsh", "advfirewall", "firewall", "add", "rule",
                "name=RDP", "dir=in", "action=allow", "protocol=TCP", "localport=3389"
            ], check=True)
            print("RDP firewall rule created successfully.")

        subprocess.run(["netsh", "advfirewall", "firewall", "set", "rule", "name=RDP", "new", "enable=yes"], check=True)

        subprocess.run(["net", "stop", "TermService"], check=True)
        subprocess.run(["net", "start", "TermService"], check=True)

        print("RDP has been configured for multiple concurrent sessions.")
    except Exception as e:
        print(f"Failed to enable RDP or configure multiple sessions: {e}")

enable_rdp()
