
def get_user_full_name():
    import ctypes
    full_name = ctypes.create_unicode_buffer(1024)
    if ctypes.windll.secur32.GetUserNameExW(3, full_name, ctypes.pointer(ctypes.c_ulong(len(full_name)))):
        full_name_str = full_name.value.strip()
        if " " in full_name_str:
            first_name, last_name = full_name_str.split(" ", 1)
        else:
            first_name, last_name = full_name_str, ""
        return {"first_name": first_name, "last_name": last_name}
    else:
        return {"first_name": "Unknown", "last_name": "Unknown"}

print(get_user_full_name())