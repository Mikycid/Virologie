

def is_rdp_enabled():

    import winreg as reg
    import subprocess
    import re
    import socket
    rdp_status = {
        "Registry": False,
        "FirewallRule": False,
        "PortListening": False,
    }
    
    try:
        key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, r"SYSTEM\CurrentControlSet\Control\Terminal Server", 0, reg.KEY_READ)
        fDenyTSConnections, reg_type = reg.QueryValueEx(key, "fDenyTSConnections")
        reg.CloseKey(key)

        if fDenyTSConnections != 1:
            rdp_status["Registry"] = True

    except FileNotFoundError:
        print("RDP registry key not found. RDP is likely not installed or configured.")
    except Exception as e:
        print(f"An error occurred while checking RDP registry key: {e}")

    try:
        si = subprocess.STARTUPINFO()
        si.dwFlags |= subprocess.STARTF_USESHOWWINDOW

        rule_check = subprocess.run(
            ["netsh", "advfirewall", "firewall", "show", "rule", "name=RDP"],
            capture_output=True,
            text=True, startupinfo=si
        )

        if rule_check.returncode == 0 and re.search(r'\bEnabled:\s*Yes\b', rule_check.stdout, re.IGNORECASE):
            rdp_status["FirewallRule"] = True

    except Exception as e:
        print(f"An error occurred: {e}")

    try:
        rdp_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        rdp_socket.settimeout(2)
        result = rdp_socket.connect_ex(('127.0.0.1', 3389))

        if result == 0:
            rdp_status["PortListening"] = True
        rdp_socket.close()
    except Exception as socket_error:
        print(f"An error occurred: {socket_error}")

    print(f"Registry: {'Enabled' if rdp_status['Registry'] else 'Disabled'}")
    print(f"Firewall Rule: {'Enabled' if rdp_status['FirewallRule'] else 'Disabled/Not Present'}")
    print(f"Port Listening: {'Yes' if rdp_status['PortListening'] else 'No'}")

is_rdp_enabled()
