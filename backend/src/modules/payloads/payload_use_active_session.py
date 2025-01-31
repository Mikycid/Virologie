def relaunch_in_user_session():
    import os
    import sys
    import subprocess
    import re

    # Get the active session ID and user
    try:
        session_id_output = subprocess.check_output("qwinsta", shell=True).decode(errors="ignore")
    except Exception as e:
        print(f"[-] Failed to retrieve session info: {e}")
        return

    active_user = None
    active_session = None

    for line in session_id_output.splitlines():
        line = line.strip()
        match = re.search(r"(\S+)\s+(\S+)\s+(\d+)\s+Actif", line, re.IGNORECASE)
        if match:
            session_name, active_user, active_session = match.groups()
            print(f"[+] Found active user: {active_user}, Session: {active_session}")
            break  # Found the active user, exit loop

    if not active_user or not active_session:
        print("[-] No active user session found.")
        print("Active sessions:")
        print(session_id_output)
        print("user:")
        print(active_user)
        return

    task_name = "RelaunchUserSession"
    script_path = sys.executable

    print(f"[*] Relaunching for user: {active_user} (Session {active_session})")

    # Create and run the scheduled task explicitly under the logged-in user
    os.system(f'schtasks /create /tn {task_name} /tr "{script_path}" /sc once /st 00:00 /f /ru "{active_user}"')
    os.system(f'schtasks /run /tn {task_name}')

    print("[+] Relaunched in user session.")

relaunch_in_user_session()
