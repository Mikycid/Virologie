def xor_encode(input_string, key):
    key_len = len(key)
    encoded = [(ord(input_string[i]) ^ ord(key[i % key_len])) for i in range(len(input_string))]
    return encoded

def format_for_c(encoded_array):
    return ", ".join(f"0x{value:02X}" for value in encoded_array)

# Input strings to encode
python_path = "C:\\Temp\\05ft8_2lthb4"
wrapper_template = (
    "import sys\n"
    "import io\n"
    "stdout_capture = io.StringIO()\n"
    "stderr_capture = io.StringIO()\n"
    "sys.stdout = stdout_capture\n"
    "sys.stderr = stderr_capture\n"
    "%s\n"
    "sys.stdout = sys.__stdout__\n"
    "sys.stderr = sys.__stderr__\n"
    "print(stdout_capture.getvalue(), end='')\n"
    "print(stderr_capture.getvalue(), end='')\n"
)
cmdline = "-c \"import sys; exec(sys.stdin.read())\""

# XOR key
xor_key = "0ltbh2lthb4"

# Encode strings
encoded_python_path = xor_encode(python_path, xor_key)
encoded_wrapper_template = xor_encode(wrapper_template, xor_key)
encoded_cmdline = xor_encode(cmdline, xor_key)
encoded_get_uuid = xor_encode("import os;print(os.popen('powershell -Command \"Get-CimInstance -Class Win32_ComputerSystemProduct | Select-Object -ExpandProperty UUID\"').read().strip().splitlines()[-1])", xor_key)

# Format output for C code
print("Encoded Python Path:")
print(format_for_c(encoded_python_path))
print("\nEncoded Wrapper Template:")
print(format_for_c(encoded_wrapper_template))
print("\nEncoded Cmdline:")
print(format_for_c(encoded_cmdline))
print("\nEncoded Get UUID:")
print(format_for_c(encoded_get_uuid))
