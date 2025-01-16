

def check_vpn_status():
    import subprocess

    si = subprocess.STARTUPINFO()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW

    config_output = subprocess.run(
        ["netsh", "interface", "ipv4", "show", "config"],
        capture_output=True, text=True, encoding='cp437', errors='ignore', check=True, startupinfo=si, creationflags=subprocess.CREATE_NO_WINDOW
    ).stdout.splitlines()

    state_output = subprocess.run(
        ["netsh", "interface", "show", "interface"],
        capture_output=True, text=True, encoding='cp437', errors='ignore', check=True, startupinfo=si, creationflags=subprocess.CREATE_NO_WINDOW
    ).stdout.splitlines()

    print(str(config_output) + "|||" + str(state_output))


check_vpn_status()
