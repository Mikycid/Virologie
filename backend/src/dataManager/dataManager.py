import uuid
import asyncio
from dataManager.repository.userRepository import UserRepository
from modules.VpnManager import VpnManager
from dotenv import load_dotenv
load_dotenv()

class DataManager:
    def __init__(self):
        self.user_repository = UserRepository()
        self.vpn_manager = VpnManager(self.user_repository)
        self.lock = asyncio.Lock()
    
        
    def generate_uuid(self):
        return str(uuid.uuid4())