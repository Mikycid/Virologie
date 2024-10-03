from dataManager.repository.userRepository import UserRepository
import logging

class UserService:

    def __init__(self, user_repository: UserRepository):
        self.user_repository = user_repository
    
    def getUsers(self):
            return self.user_repository.get_users()
    
    def getKeyloggerLogs(self, user_id):
        user = self.user_repository.get_user(user_id)
        logging.info(user_id)
        if not user:
             return {"error": "User not found"}
        return {
            "logs": user.module_data.get("keylogger")
        }