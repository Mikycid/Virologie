gcc -o executables/gen_keys.exe gen_keys.c -IC:\msys64\mingw64\include -LC:\msys64\mingw64\lib -funroll-loops -O3 -lssl -lcrypto
gcc -o executables/encrypt.exe encrypt.c -IC:\msys64\mingw64\include -LC:\msys64\mingw64\lib -funroll-loops -O3 -lssl -lcrypto
# Compile installer.exe with enhanced optimization and obfuscation flags
gcc -o executables/installer.exe installer.c `
    -I"C:\msys64\mingw64\include" `
    -L"C:\msys64\mingw64\lib" `
    -O3 -funroll-loops -lssl -lcrypto -mwindows `
  

# Compile revshell.exe with optimization and obfuscation flags
gcc -o executables/revshell.exe revshell.c `
    -I"C:\msys64\mingw64\include" `
    -L"C:\msys64\mingw64\lib" `
    -O3 -s -fvisibility=hidden -funroll-loops -fstack-protector-strong `
    -flto -mwindows -l"python311" `
    -lssl -lcrypto `
    -fdata-sections -ffunction-sections `
    -falign-functions=16 -falign-jumps=16 -falign-labels=16 -falign-loops=16 `
    -fno-ident -fno-asynchronous-unwind-tables -fno-unwind-tables `
    "-Wl,--strip-all,--no-insert-timestamp" `


