#!/usr/bin/python3 python3

import binascii

def bin_to_hex(filename):
    with open(filename, 'rb') as f:
        binary_data = f.read()
        hex_data = binascii.hexlify(binary_data).decode('ascii')
        return hex_data

hex_string = bin_to_hex('aes_key.bin')
print("AES key:" + hex_string)

hex_string = bin_to_hex('aes_iv.bin')
print("AES IV:" + hex_string)

content = bin_to_hex('encrypted_revshell.bin')
print("Encrypted reverse shell:" + content)

content = bin_to_hex('encrypted_python_installer.bin')
print("Encrypted python installer:" + content)

content = bin_to_hex('revshell.exe')
with open("revshell_hex.txt", "w") as f:
    f.write(content)

