OPTIONS = -Zp8 -c -nologo -Gy -Os -O1 -GR- -EHa -Oi -GS- \
          /I"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.38.33130\include" \
          /I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\ucrt" \
          /I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\um" \
          /I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.22621.0\shared" \
          /I"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.38.33130\lib\onecore\x64" \
          /I"C:\Program Files\OpenSSL-Win64\include"

LIBS = libvcruntime.lib libcmt.lib ucrt.lib kernel32.lib \
       libssl.lib libcrypto.lib user32.lib shell32.lib

LIBPATHS = /LIBPATH:"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.38.33130\lib\x64" \
           /LIBPATH:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\ucrt\x64" \
           /LIBPATH:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64" \
           /LIBPATH:"C:\Program Files\OpenSSL-Win64\lib\VC\x64\MD"

program:
	ML64 /c syscalls-asm.x64.asm /link /NODEFAULTLIB /RELEASE /MACHINE:X64
	cl.exe $(OPTIONS) syscalls.c program.c
	link.exe /OUT:program.x64.exe -nologo $(LIBS) $(LIBPATHS) /MACHINE:X64 -subsystem:console -nodefaultlib /ENTRY:WinMain syscalls-asm.x64.obj syscalls.obj program.obj
