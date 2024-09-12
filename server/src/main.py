import os
import asyncio
from socketServer.socketServer import SocketServer
from data.dataManager import DataManager
from dotenv import load_dotenv
load_dotenv()

if __name__ == "__main__":
    data_manager = DataManager()
    socket_server = SocketServer(os.getenv('SOCKET_HOST'), os.getenv('SOCKET_PORT'), data_manager)
    asyncio.run(socket_server.start())  # Lance le serveur