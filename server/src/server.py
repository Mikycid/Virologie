# import asyncio
# import socket

# SERVER_HOST = "0.0.0.0"
# SERVER_PORT = 8001
# BUFFER_SIZE = 1024 * 128  # 128KB max size of messages, feel free to increase
# SEPARATOR = "<sep>"

# async def handle_client(client_socket):
#     # Fonction pour gérer la connexion avec un client.
#     loop = asyncio.get_running_loop()

#     # Recevoir le répertoire de travail courant
#     cwd = await loop.sock_recv(client_socket, BUFFER_SIZE)
#     cwd = cwd.decode()
#     print("[+] Current working directory:", cwd)

#     while True:
#         # Obtenir la commande de l'utilisateur
#         command = input(f"{cwd} $> ")
#         if not command.strip():
#             continue

#         # Envoyer la commande au client
#         await loop.sock_sendall(client_socket, command.encode())

#         if command.lower() == "exit":
#             # Si la commande est "exit", on quitte la boucle
#             break

#         # Recevoir les résultats de la commande
#         output = await loop.sock_recv(client_socket, BUFFER_SIZE)
#         output = output.decode()

#         # Séparer les résultats et le répertoire courant
#         results, cwd = output.split(SEPARATOR)

#         # Afficher les résultats
#         print(results)

#     client_socket.close()


# async def start_server():
#     server = await asyncio.start_server(handle_client, '0.0.0.0', 8001)
#     addr = server.sockets[0].getsockname()
#     print(f"Serveur en écoute sur {addr}")

#     async with server:
#         await server.serve_forever()


# if __name__ == "__main__":
#     asyncio.run(start_server())

import asyncio

async def handle_client(reader, writer):

    BUFFER_SIZE = 1024 * 128 # 128KB max size of messages, feel free to increase
    # separator string for sending 2 messages in one go
    SEPARATOR = "<sep>"

    addr = writer.get_extra_info('peername')
    print(f"Connexion reçue de {addr}")

    cwd = (await reader.read(BUFFER_SIZE)).decode()
    print("[+] Current working directory:", cwd)

    # while True:
    #     # get the command from prompt
    #     command = input(f"{cwd} $> ")

    #     if not command.strip():
    #         # empty command
    #         continue
    #     # send the command to the client
    #     writer.write(command.encode())
    #     await writer.drain() # Assure que les données sont envoyées
    #     if command.lower() == "exit":
    #         # if the command is exit, just break out of the loop
    #         break
    #     # retrieve command results
    #     output = (await reader.read(BUFFER_SIZE)).decode()
    #     # split command output and current directory
    #     results, cwd = output.split(SEPARATOR)
    #     # print output
    #     print(results)

    while True:
        await asyncio.sleep(1)

    
    print(f"Connexion fermée avec {addr}")
    writer.close()
    await writer.wait_closed()

async def main():
    server = await asyncio.start_server(handle_client, '0.0.0.0', 8001)
    addr = server.sockets[0].getsockname()
    print(f"Serveur en écoute sur {addr}")

    async with server:
        await server.serve_forever()

if __name__ == "__main__":
    asyncio.run(main())