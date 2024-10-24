from dataManager.repository.userRepository import UserRepository
import logging
import asyncio

class UserService:

    def __init__(self, user_repository: UserRepository, lock: asyncio.Lock):
        self.user_repository = user_repository
        self.lock = lock
    
    def getUsers(self):
        user_list = self.user_repository.get_user_list()
        
        for user in user_list:
            if "module_data" in user:
                del user["module_data"]
        
        return user_list
    
    
    async def executePythonShell(self, user_id, command):
        user = self.user_repository.get_user(user_id)
        
        if not user:
            return {"error": "User not found"}
        await user.send("print('pause')")
        async with user.lock:
            await user.send(command)
            return {
                "message": f"> : {(await user.receive()).decode()}"
            }