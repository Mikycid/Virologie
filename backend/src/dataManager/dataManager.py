import uuid
import asyncio
from dataManager.repository.userRepository import UserRepository
from modules.VpnModule import VpnModule
from modules.RdpModule import RdpModule
from modules.KeyloggerModule import KeyloggerModule
from modules.CrackModule import CrackModule
from modules.ExploitModule import ExploitModule
from modules.AgentModule import AgentModule
from modules.Recognizer import Recognizer
from modules.SystemModule import SystemModule
from modules.ADModule import ADModule
from dotenv import load_dotenv
load_dotenv()

class DataManager:
    def __init__(self):
        self.user_repository = UserRepository()
        self.vpn_module = VpnModule(self.user_repository)
        self.rdp_module = RdpModule(self.user_repository)
        self.keylogger_module = KeyloggerModule(self.user_repository)
        self.crack_module = CrackModule(self.user_repository)
        self.exploit_module = ExploitModule(self.user_repository)
        self.agent_module = AgentModule(self.user_repository)
        self.recognizer_module = Recognizer(self.user_repository)
        self.system_module = SystemModule(self.user_repository)
        self.ad_module = ADModule(self.user_repository)
        self.lock = asyncio.Lock()

    def start(self):
        asyncio.create_task(self.agent_module.start())
    
        
    def generate_uuid(self):
        return str(uuid.uuid4())