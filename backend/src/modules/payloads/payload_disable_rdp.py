def disable_rdp():
    import winreg as reg
    import subprocess
    try:
        # Open the registry key for Remote Desktop settings
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, r"SYSTEM\CurrentControlSet\Control\Terminal Server", 0, reg.KEY_SET_VALUE)

        # Set the fDenyTSConnections value to 1 to disable RDP
        reg.SetValueEx(key, "fDenyTSConnections", 0, reg.REG_DWORD, 1)
        reg.CloseKey(key)

        # Disable the RDP firewall rule
        subprocess.run(["netsh", "advfirewall", "firewall", "set", "rule", "name=RDP", "new", "enable=no"], check=True)

        print("RDP has been disabled.")
    except Exception as e:
        print(f"Failed to disable RDP: {e}")

# Call the function to disable RDP
disable_rdp()
