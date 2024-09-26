import json
from helper.fileManager import FileManager
from classes.user import User

class UserService:
    
    def getUsers(self):
        try:
            data = FileManager().read('/users.json')
            return {user_data['uuid']: User.from_dict(user_data) for user_data in data}
        except (FileNotFoundError, json.JSONDecodeError):
            print("Aucun utilisateur existant à charger.")
            return {}