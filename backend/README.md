Generate the certificates using : 

```bash
cd certs
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```

Press enter multiple times (entering nothing in the informations asked is fine)