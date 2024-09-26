import uuid
from server.src.classes.userRepository import UserRepository
from dotenv import load_dotenv
load_dotenv()

class DataManager:
    def __init__(self):
        self.user_repository = UserRepository()
    
        
    def generate_uuid(self):
        return str(uuid.uuid4())