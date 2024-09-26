import os
import asyncio
import uvicorn
from socketServer.socketServer import SocketServer
from dataManager.dataManager import DataManager
from dotenv import load_dotenv
from api import api  # Importer l'application FastAPI de app.py

# Charger les variables d'environnement
load_dotenv()

# Fonction pour démarrer le serveur FastAPI
async def start_fastapi():
    config = uvicorn.Config("app:app", host=os.getenv('API_HOST'), port=os.getenv('API_PORT'), log_level="info")
    server = uvicorn.Server(config)
    await server.serve()

# Fonction pour démarrer le serveur socket
async def start_socket_server():
    data_manager = DataManager()
    socket_server = SocketServer(os.getenv('SOCKET_HOST'), os.getenv('SOCKET_PORT'), data_manager)
    await socket_server.start()

# Fonction principale qui lance les deux serveurs en parallèle
async def main():
    await asyncio.gather(
        start_fastapi(),         # Lancer FastAPI
        start_socket_server()    # Lancer le serveur socket
    )

if __name__ == "__main__":
    # Lancer la boucle asyncio avec les deux serveurs
    asyncio.run(main())
