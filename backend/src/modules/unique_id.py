import os
print(os.popen("powershell -Command \"Get-CimInstance -Class Win32_ComputerSystemProduct | Select-Object -ExpandProperty UUID\"").read().strip().splitlines()[-1])