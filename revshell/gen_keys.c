#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/rand.h>
#include <openssl/applink.c>
#include <stdio.h>
#include <stdlib.h>

#define RSA_KEY_BITS 2048
#define AES_KEY_BITS 256
#define AES_IV_SIZE 16

void generate_rsa_keypair(const char *privkey_file, const char *pubkey_file) {
    RSA *rsa = RSA_new();
    BIGNUM *bn = BN_new();
    FILE *privkey = fopen(privkey_file, "wb");
    FILE *pubkey = fopen(pubkey_file, "wb");

    if (!privkey || !pubkey) {
        perror("Unable to open key files");
        exit(EXIT_FAILURE);
    }

    BN_set_word(bn, RSA_F4);
    RSA_generate_key_ex(rsa, RSA_KEY_BITS, bn, NULL);

    PEM_write_RSAPrivateKey(privkey, rsa, NULL, NULL, 0, NULL, NULL);
    PEM_write_RSAPublicKey(pubkey, rsa);

    fclose(privkey);
    fclose(pubkey);
    RSA_free(rsa);
    BN_free(bn);
}

void generate_aes_key(const char *key_file, const char *iv_file) {
    unsigned char aes_key[AES_KEY_BITS / 8];
    unsigned char aes_iv[AES_IV_SIZE];

    FILE *key_fp = fopen(key_file, "wb");
    FILE *iv_fp = fopen(iv_file, "wb");

    if (!key_fp || !iv_fp) {
        perror("Unable to open key files");
        exit(EXIT_FAILURE);
    }

    if (!RAND_bytes(aes_key, sizeof(aes_key)) || !RAND_bytes(aes_iv, sizeof(aes_iv))) {
        perror("Error generating AES key or IV");
        exit(EXIT_FAILURE);
    }

    printf("AES Key: %s\n", aes_key);
    printf("AES IV: %s\n", aes_iv);

    fwrite(aes_key, 1, sizeof(aes_key), key_fp);
    fwrite(aes_iv, 1, sizeof(aes_iv), iv_fp);

    fclose(key_fp);
    fclose(iv_fp);
}

int main() {
    generate_rsa_keypair("rsa_privkey.pem", "rsa_pubkey.pem");
    generate_aes_key("aes_key.bin", "aes_iv.bin");
    return 0;
}