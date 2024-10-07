def check_vpn_status():
    import subprocess
    import re

    si = subprocess.STARTUPINFO()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW

    output = subprocess.run(
        ["netsh", "interface", "ipv4", "show", "config"],
        capture_output=True, text=True, encoding='cp437', errors='ignore', check=True, startupinfo=si
    ).stdout.splitlines()

    interface_regex = re.compile(r"^Configuration pour l'interface «(.+?)»")
    ip_regex = re.compile(r"Adresse IP\s*:\s*(\d+\.\d+\.\d+\.\d+)")

    current_interface = None

    interfaces = {}

    for line in output:
        if (interface_match := interface_regex.match(line)):
            current_interface = interface_match.group(1).strip()
            continue
        
        if current_interface and (ip_match := ip_regex.search(line)):
            interfaces[current_interface] = ip_match.group(1)

    return interfaces

print(check_vpn_status())
