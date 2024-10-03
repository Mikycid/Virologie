# main.py
from logs.logger import setup_logging
setup_logging()

import os
import asyncio
import uvicorn
from socketServer.socketServer import SocketServer  # Adjust import based on your structure
from dataManager.dataManager import DataManager
from dotenv import load_dotenv
from app_state import AppState  # Import the AppState class
from api.api import create_app  # Import the create_app function

# Load environment variables
load_dotenv()
data_manager = DataManager()

# Create the shared state object
app_state = AppState(data_manager)

# Create the FastAPI app with the shared state
fastapi_app = create_app(app_state)

# Function to start the FastAPI server
async def start_fastapi():
    config = uvicorn.Config(app=fastapi_app, host=os.getenv('API_HOST'), port=int(os.getenv('API_PORT')), log_level="info", reload=True)
    server = uvicorn.Server(config)
    await server.serve()

# Function to start the socket server
async def start_socket_server():
    socket_server = SocketServer(os.getenv('SOCKET_HOST'), int(os.getenv('SOCKET_PORT')), app_state.data_manager)
    await socket_server.start()

# Main function to run both servers concurrently
async def main():
    await asyncio.gather(
        start_socket_server(),  # Launch the socket server
        start_fastapi()         # Launch the FastAPI server
    )

if __name__ == "__main__":
    # Run the asyncio loop with both servers
    asyncio.run(main())
