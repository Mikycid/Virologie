from modules.ADModule import ADModule
from dataManager.repository.userRepository import UserRepository
from fastapi import HTTPException

import logging
class ADService:
    def __init__(self, adModule: ADModule, user_repository: UserRepository):
        self.adModule = adModule
        self.user_repository = user_repository

    async def list_users(self, id: str):
        try:
            return await self.adModule.list_users(id)
        except Exception as e:
            logging.error(e)
            raise HTTPException(status_code=400, detail=str(e))
        
    async def list_machines(self, id: str):
        try:
            return await self.adModule.list_machines(id)
        except Exception as e:
            logging.error(e)
            raise HTTPException(status_code=400, detail=str(e))
    
    async def propagate(self, id: str):
        try:
            return await self.adModule.propagate(id)
        except Exception as e:
            logging.error(e)
            raise HTTPException(status_code=400, detail=str(e))
