

def main():
    import subprocess
    import os
    import re
    import signal
    pid = None
    try:
        output = subprocess.check_output(['tasklist'], universal_newlines=True)

        # Match either openvpn-gui.exe or openvpn.exe
        match = re.search(r'openvpn(?:-gui)?\.exe\s+(\d+)', output)

        if match:
            pid = int(match.group(1))
            try:
                os.kill(pid, signal.SIGTERM)
                print(f"Terminated OpenVPN process with PID: {pid}")
            except Exception as e:
                print(f"Error terminating OpenVPN process: {e}")
        else:
            print("No matching OpenVPN process found.")
    except subprocess.CalledProcessError as e:
        print(f"Error checking running processes: {e}")

main()