def disable_rdp():
    import winreg as reg
    import subprocess
    try:
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, r"SYSTEM\CurrentControlSet\Control\Terminal Server", 0, reg.KEY_SET_VALUE)

        reg.SetValueEx(key, "fDenyTSConnections", 0, reg.REG_DWORD, 1)
        reg.CloseKey(key)

        subprocess.run(["netsh", "advfirewall", "firewall", "set", "rule", "name=RDP", "new", "enable=no"], check=True, creationflags=subprocess.CREATE_NO_WINDOW)

        print("Success")
    except Exception as e:
        print(f"Failed to disable RDP: {e}")

disable_rdp()
