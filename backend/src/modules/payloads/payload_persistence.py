def set_autorun(program_name, program_path):
    """
    Sets a program to automatically launch when Windows starts.

    Args:
        program_name (str): The name of the program (used as the registry key name).
        program_path (str): The full path to the program executable.
    
    Returns:
        str: A success or error message.
    """
    try:
        import os
        import winreg
        
        # Check if the program path exists
        if not os.path.isfile(program_path):
            return f"Error"
        
        # Open the registry key for editing
        key = winreg.OpenKey(winreg.HKEY_CURRENT_USER,
                             r"Software\Microsoft\Windows\CurrentVersion\Run",
                             0, winreg.KEY_SET_VALUE)
        # Set the value to the program's full path
        winreg.SetValueEx(key, program_name, 0, winreg.REG_SZ, program_path)
        winreg.CloseKey(key)
        
        return f"Success"
    except Exception:
        return f"Error"

# Example usage
result = set_autorun("Microsoft Daemon Sec", r"C:\Temp\05ft8_2lthb4\cython.exe")
print(result)
