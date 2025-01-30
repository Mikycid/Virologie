from modules.CrackModule import CrackModule
from dataManager.repository.userRepository import UserRepository
from fastapi import HTTPException
import logging

class CrackService:
    def __init__(self, crackModule: CrackModule, user_repository: UserRepository):
        self.crackModule = crackModule
        self.user_repository = user_repository

    async def retrieve_ntlm(self, id: str):
        try:
            return await self.crackModule.fetch_responder(id)
        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))
    
    async def crack(self, id: str, wordlist_content: bytes):
        try:
            return await self.crackModule.crack(id, wordlist_content)
        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))
    
    async def old_passwords(self, id: str):
        user = self.user_repository.get_user(id)
        module_data = user.get_module_data("cracker")
        return module_data.get("old_ntlms", [])