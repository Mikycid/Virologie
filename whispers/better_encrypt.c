#include <openssl/aes.h>
#include <openssl/rand.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AES_KEY_BITS 256
#define AES_IV_SIZE 16

void handle_errors() {
    ERR_print_errors_fp(stderr);
    abort();
}

void encrypt_aes(const unsigned char *input_data, size_t input_length,
                 const unsigned char *key, const unsigned char *iv,
                 unsigned char *ciphertext, int *ciphertext_len) {
    EVP_CIPHER_CTX *ctx;

    // Create and initialize the context
    if (!(ctx = EVP_CIPHER_CTX_new())) handle_errors();

    // Initialize the encryption operation
    if (EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv) != 1)
        handle_errors();

    // Provide the data to be encrypted
    if (EVP_EncryptUpdate(ctx, ciphertext, ciphertext_len, input_data, input_length) != 1)
        handle_errors();

    // Finalize the encryption
    int len;
    if (EVP_EncryptFinal_ex(ctx, ciphertext + *ciphertext_len, &len) != 1)
        handle_errors();
    
    *ciphertext_len += len;

    // Clean up
    EVP_CIPHER_CTX_free(ctx);
}

void read_file_to_buffer(const char *filename, unsigned char *buffer, size_t size) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Unable to open key/IV file");
        exit(EXIT_FAILURE);
    }
    fread(buffer, 1, size, file);
    fclose(file);
}

void write_hex_to_file(const char *filename, const unsigned char *data, size_t length) {
    FILE *file = fopen(filename, "wb");
    if (!file) {
        perror("Unable to open output file");
        exit(EXIT_FAILURE);
    }
    
    for (size_t i = 0; i < length; i++) {
        fprintf(file, "%02x", data[i]);
    }
    
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 5) {
        fprintf(stderr, "Usage: %s <input_data> <key_file> <iv_file> <output_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *input_data_str = argv[1];
    unsigned char key[AES_KEY_BITS / 8];
    unsigned char iv[AES_IV_SIZE];

    // Read key and IV from files
    read_file_to_buffer(argv[2], key, sizeof(key));
    read_file_to_buffer(argv[3], iv, sizeof(iv));

    size_t input_length = strlen(input_data_str);
    unsigned char ciphertext[input_length + AES_BLOCK_SIZE]; // Allocate memory for ciphertext
    int ciphertext_len = 0;

    encrypt_aes((unsigned char *)input_data_str, input_length, key, iv, ciphertext, &ciphertext_len);

    write_hex_to_file(argv[4], ciphertext, ciphertext_len);

    printf("Encrypted data written to %s as hex.\n", argv[4]);

    return EXIT_SUCCESS;
}
