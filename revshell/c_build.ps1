gcc -o executables/gen_keys.exe gen_keys.c -IC:\msys64\mingw64\include -LC:\msys64\mingw64\lib -funroll-loops -O3 -lssl -lcrypto
gcc -o executables/encrypt.exe encrypt.c -IC:\msys64\mingw64\include -LC:\msys64\mingw64\lib -funroll-loops -O3 -lssl -lcrypto
gcc -o executables/installer.exe installer.c -I"C:\msys64\mingw64\include" -L"C:\msys64\mingw64\lib" -funroll-loops -O3 -lssl -lcrypto 
gcc -o executables/revshell.exe revshell.c -I"C:\msys64\mingw64\include" -L"C:\msys64\mingw64\lib" -l"python311" -funroll-loops -O3 -lssl -lcrypto  -mwindows

