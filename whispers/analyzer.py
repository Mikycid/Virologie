import frida
import sys
import time
import argparse
from datetime import datetime

def log_to_file(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open("malware_analysis.log", "a") as f:
        f.write(f"[{timestamp}] {message}\n")

def on_message(message, data):
    if message["type"] == "send":
        msg = "[+] {}".format(message["payload"])
        print(msg)
        log_to_file(msg)
    elif message["type"] == "error":
        msg = "[-] {}".format(message["stack"])
        print(msg)
        log_to_file(msg)

jscode = """
let moduleBaseAddress = null;
let moduleSize = 0;

function initializeModuleInfo() {
    Process.enumerateModules({
        onMatch: function(module) {
            if (module.name === Process.mainModule.name) {
                moduleBaseAddress = module.base;
                moduleSize = module.size;
                send(`[INFO] Main module base: ${moduleBaseAddress}, size: ${moduleSize}`);
            }
        },
        onComplete: function() {}
    });
}

function monitorAntiAnalysis() {
    const antiDebugFuncs = [
        'IsDebuggerPresent',
        'CheckRemoteDebuggerPresent',
        'OutputDebugStringA',
        'OutputDebugStringW',
        'NtQueryInformationProcess',
        'GetTickCount',
        'QueryPerformanceCounter',
        'GetSystemTime',
        'GetNativeSystemInfo'
    ];

    antiDebugFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        send(`[ANTI-ANALYSIS] ${funcName} called`);
                    }
                });
            }
        } catch(e) {}
    });
}

function monitorCodeExecution() {
    const execFuncs = [
        'VirtualProtect',
        'VirtualProtectEx',
        'WriteProcessMemory',
        'NtWriteVirtualMemory',
        'NtProtectVirtualMemory',
        'CreateFileMappingA',
        'CreateFileMappingW',
        'MapViewOfFile',
        'MapViewOfFileEx'
    ];

    execFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        send(`[CODE-EXECUTION] ${funcName} called`);
                        if (funcName.includes('VirtualProtect')) {
                            const protection = args[2].toInt32();
                            if (protection & 0x40) {
                                send(`  └─ WARNING: Memory region marked as executable!`);
                            }
                        }
                    }
                });
            }
        } catch(e) {}
    });
}

function monitorProcessOperations() {
    const procFuncs = [
        'CreateProcessA',
        'CreateProcessW',
        'OpenProcess',
        'CreateRemoteThread',
        'CreateRemoteThreadEx',
        'NtCreateThreadEx',
        'RtlCreateUserThread',
        'OpenThread',
        'SuspendThread',
        'ResumeThread',
        'QueueUserAPC'
    ];

    procFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        send(`[PROCESS] ${funcName} called`);
                        if (funcName.includes('CreateProcess')) {
                            const cmdLine = args[1].readUtf16String();
                            send(`  └─ Command: ${cmdLine}`);
                        }
                    }
                });
            }
        } catch(e) {}
    });
}

function monitorNetworking() {
    const networkFuncs = [
        'socket',
        'connect',
        'send',
        'recv',
        'WSAConnect',
        'WSASend',
        'WSARecv',
        'InternetOpenA',
        'InternetOpenW',
        'InternetConnectA',
        'InternetConnectW',
        'HttpOpenRequestA',
        'HttpOpenRequestW',
        'HttpSendRequestA',
        'HttpSendRequestW',
        'WSAStartup'
    ];

    networkFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        send(`[NETWORK] ${funcName} called`);
                        if (funcName.includes('connect')) {
                            try {
                                // Attempt to read sockaddr structure
                                const sa = args[1];
                                const sa_family = sa.readU16();
                                if (sa_family === 2) { // AF_INET
                                    const port = sa.add(2).readU16();
                                    const addr = sa.add(4).readU32();
                                    send(`  └─ Connecting to: ${addr}:${port}`);
                                }
                            } catch(e) {}
                        }
                    }
                });
            }
        } catch(e) {}
    });
}

function monitorFileOperations() {
    const fileFuncs = [
        'CreateFileA',
        'CreateFileW',
        'WriteFile',
        'ReadFile',
        'DeleteFileA',
        'DeleteFileW',
        'CopyFileA',
        'CopyFileW',
        'MoveFileA',
        'MoveFileW',
        'SetFileAttributesA',
        'SetFileAttributesW'
    ];

    fileFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        if (funcName.includes('CreateFile') || 
                            funcName.includes('DeleteFile') || 
                            funcName.includes('CopyFile') || 
                            funcName.includes('MoveFile')) {
                            const fileName = funcName.endsWith('A') ? 
                                args[0].readAnsiString() : 
                                args[0].readUtf16String();
                            send(`[FILE] ${funcName} called on: ${fileName}`);
                        } else {
                            send(`[FILE] ${funcName} called`);
                        }
                    }
                });
            }
        } catch(e) {}
    });
}

function monitorRegistry() {
    const regFuncs = [
        'RegOpenKeyExA',
        'RegOpenKeyExW',
        'RegCreateKeyExA',
        'RegCreateKeyExW',
        'RegDeleteKeyA',
        'RegDeleteKeyW',
        'RegSetValueExA',
        'RegSetValueExW',
        'RegQueryValueExA',
        'RegQueryValueExW'
    ];

    regFuncs.forEach(funcName => {
        try {
            const func = Module.findExportByName(null, funcName);
            if (func) {
                Interceptor.attach(func, {
                    onEnter: function(args) {
                        try {
                            const keyPath = args[1].readUtf16String();
                            send(`[REGISTRY] ${funcName} called on: ${keyPath}`);
                        } catch(e) {
                            send(`[REGISTRY] ${funcName} called`);
                        }
                    }
                });
            }
        } catch(e) {}
    });
}

function scanForShellcode() {
    const pattern = "\\x55\\x8B\\xEC"; // Common function prologue
    Memory.scan(moduleBaseAddress, moduleSize, pattern, {
        onMatch: function(address, size) {
            send(`[SHELLCODE] Potential shellcode found at: ${address}`);
            // Dump a few bytes for analysis
            const bytes = Memory.readByteArray(address, 16);
            send(`  └─ First 16 bytes: ${bytes}`);
        },
        onError: function(reason) {
            send(`[SHELLCODE] Scan error: ${reason}`);
        },
        onComplete: function() {}
    });
}

function monitorDLLLoading() {
    Interceptor.attach(Module.findExportByName(null, 'LoadLibraryA'), {
        onEnter: function(args) {
            const dllName = args[0].readAnsiString();
            send(`[DLL] Loading library: ${dllName}`);
        }
    });
    
    Interceptor.attach(Module.findExportByName(null, 'LoadLibraryW'), {
        onEnter: function(args) {
            const dllName = args[0].readUtf16String();
            send(`[DLL] Loading library: ${dllName}`);
        }
    });
}

// Initialize and start monitoring
initializeModuleInfo();
monitorAntiAnalysis();
monitorCodeExecution();
monitorProcessOperations();
monitorNetworking();
monitorFileOperations();
monitorRegistry();
monitorDLLLoading();
setTimeout(scanForShellcode, 1000); // Delay shellcode scan to let the program initialize
"""

def main():
    parser = argparse.ArgumentParser(description='Advanced Malware Analysis Tool')
    parser.add_argument('executable', help='Path to the executable to analyze')
    parser.add_argument('args', nargs='*', help='Arguments to pass to the executable')
    parser.add_argument('--timeout', type=int, default=0, help='Analysis timeout in seconds (0 for no timeout)')
    
    args = parser.parse_args()
    
    try:
        print(f"[*] Starting analysis of {args.executable}")
        log_to_file(f"Starting analysis of {args.executable}")
        
        print("[*] Spawning process...")
        pid = frida.spawn([args.executable] + args.args)
        session = frida.attach(pid)
        
        print("[*] Creating script...")
        script = session.create_script(jscode)
        script.on('message', on_message)
        
        print("[*] Loading script...")
        script.load()
        
        print("[*] Resuming process...")
        frida.resume(pid)
        
        start_time = time.time()
        try:
            while args.timeout == 0 or (time.time() - start_time) < args.timeout:
                time.sleep(1)
        except KeyboardInterrupt:
            print("\n[*] Analysis interrupted by user")
            
    except Exception as e:
        print(f"[!] Error: {str(e)}")
        log_to_file(f"Error: {str(e)}")
    finally:
        if 'session' in locals():
            session.detach()
        print("[*] Analysis complete")
        log_to_file("Analysis complete")

if __name__ == '__main__':
    main()