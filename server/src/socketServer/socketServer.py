import asyncio
from classes.user import User
from data.dataManager import DataManager
from data.users.userRepository import UserRepository


class SocketServer:
    def __init__(self, host="0.0.0.0", port=8001, data_manager=None):
        self.host = host
        self.port = port
        self.data_manager: DataManager = data_manager
        self.user_repository: UserRepository = data_manager.user_repository
    


    async def handle_client(self, reader, writer):
        BUFFER_SIZE = 1024 * 128  # Taille max des messages
        SEPARATOR = "<sep>"

        ip, port = writer.get_extra_info('peername')
        print(f"Connexion reçue de {ip}:{port}\n")

        # Créer un nouvel utilisateur
        uuid = self.data_manager.generate_uuid()
        self.user_repository.add_user(User(uuid, ip, port, reader, writer))

    async def start(self):
        server = await asyncio.start_server(self.handle_client, self.host, self.port)
        addr = server.sockets[0].getsockname()
        print(f"Serveur en écoute sur {addr}\n")

        async with server:
            await server.serve_forever()
