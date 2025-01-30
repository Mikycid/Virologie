# main.py
from logs.logger import setup_logging
setup_logging()

import os
import asyncio
import uvicorn
from socketServer.socketServer import SocketServer
from dataManager.dataManager import DataManager
from dotenv import load_dotenv
from app_state import AppState
from api.api import create_app

# Load environment variables
load_dotenv()
data_manager = DataManager()

app_state = AppState(data_manager)

fastapi_app = create_app(app_state)

async def start_fastapi():
    config = uvicorn.Config(app=fastapi_app, host=os.getenv('API_HOST'), port=int(os.getenv('API_PORT')), log_level="info", reload=True)
    server = uvicorn.Server(config)
    await server.serve()

async def start_socket_server():
    socket_server = SocketServer(app_state, os.getenv('SOCKET_HOST'), int(os.getenv('SOCKET_PORT')))
    await socket_server.start()

async def main():
    data_manager.start()
    await asyncio.gather(
        start_socket_server(),
        start_fastapi()
    )

if __name__ == "__main__":
    asyncio.run(main())
