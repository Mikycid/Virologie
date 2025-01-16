

def get_user_infos():
    import subprocess
    import ctypes
    from ctypes import wintypes
    # Check if the user is an administrator
    is_admin = ctypes.windll.shell32.IsUserAnAdmin()

    # Check if the user is a domain administrator using PowerShell
    powershell_script = """
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $Groups = $User.Groups | ForEach-Object {
        $_.Translate([System.Security.Principal.SecurityIdentifier]).Value
    }
    $DomainAdminSID = $Groups | Where-Object { $_ -match '^S-1-5-21-[\\d-]+-512$' }
    $DomainAdminSID -ne $null
    """
    try:
        result = subprocess.run(
            ["powershell", "-Command", powershell_script],
            capture_output=True,
            text=True,
            creationflags=subprocess.CREATE_NO_WINDOW,
        )
        is_domain_admin = result.stdout.strip().lower() == "true"
    except Exception:
        is_domain_admin = False

    # Get the user's full name
    full_name = ctypes.create_unicode_buffer(1024)
    if ctypes.windll.secur32.GetUserNameExW(3, full_name, ctypes.pointer(ctypes.c_ulong(len(full_name)))):
        full_name_str = full_name.value.strip()
        if " " in full_name_str:
            first_name, last_name = full_name_str.split(" ", 1)
        else:
            first_name, last_name = full_name_str, ""
    else:
        first_name, last_name = "Unknown", ""

    # Get the username
    username = ctypes.create_unicode_buffer(1024)
    if ctypes.windll.advapi32.GetUserNameW(username, ctypes.pointer(ctypes.c_ulong(len(username)))):
        username_str = username.value.strip()
    else:
        username_str = "Unknown"

    # Get the domain name
    netapi32 = ctypes.windll.netapi32
    domain_name = ctypes.c_wchar_p()
    buffer_type = wintypes.DWORD()
    domain_name_result = None

    try:
        if netapi32.NetGetJoinInformation(None, ctypes.byref(domain_name), ctypes.byref(buffer_type)) == 0:
            domain_name_result = domain_name.value
        else:
            domain_name_result = "Unknown or Not Joined"
    finally:
        if domain_name:
            netapi32.NetApiBufferFree(domain_name)

    # Get the NetBIOS machine (computer) name
    computer_name = ctypes.create_unicode_buffer(1024)
    size = wintypes.DWORD(len(computer_name))
    if ctypes.windll.kernel32.GetComputerNameExW(1, computer_name, ctypes.pointer(size)):  # 1 for NetBIOS name
        machine_name = computer_name.value.strip()
    else:
        machine_name = "Unknown"

    return {
        "first_name": first_name,
        "last_name": last_name,
        "username": username_str,
        "is_admin": is_admin,
        "is_domain_admin": is_domain_admin,
        "domain_name": domain_name_result,
        "machine_name": machine_name
    }

print(get_user_infos())
