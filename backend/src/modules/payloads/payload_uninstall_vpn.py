

def main():
    import os
    import shutil
    install_dir = r"C:\Program Files\TAP-Windows"
    temp_ovpn_dir = r"C:\Temp\ovpnConfig"
    install_custom_dir = r"C:\Program Files\TAP Driver"

    try:
        # Remove the TAP Driver installation directory
        if os.path.exists(install_dir):
            shutil.rmtree(install_dir)

        # Remove the temporary OpenVPN config directory
        if os.path.exists(temp_ovpn_dir):
            shutil.rmtree(temp_ovpn_dir)

        if os.path.exists(install_custom_dir):
            shutil.rmtree(install_custom_dir)

        print("Cleanup completed successfully.")
        
    except Exception as e:
        print(f"An error occurred during cleanup: {str(e)}")

main()

