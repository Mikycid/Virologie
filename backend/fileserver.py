import ssl
import http.server
import socketserver

def main():
    handler = http.server.SimpleHTTPRequestHandler
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    
    import os
    if not os.path.exists('/certs/cert.pem'):
        os.system('cd /certs && openssl req -x509 -newkey rsa:4096 -nodes -out cert.pem -keyout key.pem -days 365 -subj "/CN=localhost"')
    
    context.load_cert_chain("/certs/cert.pem", "/certs/key.pem")
    server = socketserver.TCPServer(("0.0.0.0", 8080), handler)
    server.socket = context.wrap_socket(server.socket, server_side=True)
    print("Serving HTTPS on port 8080")
    server.serve_forever()

if __name__ == "__main__":
    main()
