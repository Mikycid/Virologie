from cx_Freeze import setup, Executable

# Replace 'revshell.py' with your Python script name
setup(
    name="revshell",  # Name of the application
    version="1.0",  # Version number
    description="My Python Reverse Shell",  # Description of the application
    options={
        "build_exe": {
            "packages": ["os", "sys"],  # Add any packages your script uses
            "include_files": [],  # Add any additional files if needed
            "optimize": 2,  # Optimize bytecode (optional)
            "zip_include_packages": "*",  # This will bundle all dependencies into the EXE
            "zip_exclude_packages": "",  # Ensure this is not specified
            "include_msvcr": True,  # Include Microsoft Visual C++ runtime (optional)
        }
    },
    executables=[Executable("revshell.py", base=None, target_name="revshell.exe")]
)
