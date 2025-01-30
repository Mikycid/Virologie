from dataManager.repository.userRepository import UserRepository
import logging

class SystemModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "system"
        self.user_repository: UserRepository = user_repository

    async def list_processes(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
    
        return user.processes 