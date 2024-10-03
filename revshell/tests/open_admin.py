import os
import sys
import platform
import ctypes

def request_admin_rights():
    if platform.system() == "Windows":
        try:
            return ctypes.windll.shell32.IsUserAnAdmin()
        except:
            return False
    elif platform.system() == "Linux":
        return os.geteuid() == 0
    else:
        raise OSError(f"Unsupported operating system: {platform.system()}")

if not request_admin_rights():
    if platform.system() == "Windows":
        print("Requesting administrator privileges...")
        ctypes.windll.shell32.ShellExecuteW(
            None, "runas", sys.executable, ' '.join(sys.argv), None, 1
        )
    elif platform.system() == "Linux":
        print("This script requires root privileges. Please re-run it using 'sudo'.")
    sys.exit()
else:
    print("Script is running with the necessary privileges.")
    # Continue with the rest of the script
