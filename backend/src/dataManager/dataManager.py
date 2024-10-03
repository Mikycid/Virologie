import uuid
import asyncio
from dataManager.repository.userRepository import UserRepository
from dotenv import load_dotenv
load_dotenv()

class DataManager:
    def __init__(self):
        self.user_repository = UserRepository()
        self.lock = asyncio.Lock()
    
        
    def generate_uuid(self):
        return str(uuid.uuid4())