
def get_user_infos():
    import ctypes
    is_admin = ctypes.windll.shell32.IsUserAnAdmin()
    is_domain_admin = ctypes.windll.advapi32.CheckTokenMembership(None, ctypes.c_void_p(), ctypes.pointer(ctypes.c_bool()))
    full_name = ctypes.create_unicode_buffer(1024)
    if ctypes.windll.secur32.GetUserNameExW(3, full_name, ctypes.pointer(ctypes.c_ulong(len(full_name)))):
        full_name_str = full_name.value.strip()
        if " " in full_name_str:
            first_name, last_name = full_name_str.split(" ", 1)
        else:
            first_name, last_name = full_name_str, ""
    else:
        first_name, last_name = "Unknown", ""
    
    username = ctypes.create_unicode_buffer(1024)
    if ctypes.windll.advapi32.GetUserNameW(username, ctypes.pointer(ctypes.c_ulong(len(username)))):
        username_str = username.value.strip()
    else:
        username_str = "Unknown"
    return { "first_name": first_name, "last_name": last_name, "username": username_str, "is_admin": is_admin, "is_domain_admin": is_domain_admin}

print(get_user_infos())
