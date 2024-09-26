import os
import json
from classes.user import User
from dotenv import load_dotenv
load_dotenv()

class UserRepository:
    def __init__(self):
        self.users_file = os.getenv('FILES_PATH') + '/users/users.json'
        self.ensure_data_directory_exists()
        self.users = self.load_users()
        
    def load_users(self):
        self.ensure_data_directory_exists()
        try:
            with open(self.users_file, 'r') as f:
                data = json.load(f)
                return {user_data['uuid']: User.from_dict(user_data) for user_data in data}
        except (FileNotFoundError, json.JSONDecodeError):
            print("Aucun utilisateur existant à charger.")
            return {}
    
    # def ensure_data_directory_exists(self):
    #     directory = os.path.dirname(self.users_file)
    #     if not os.path.exists(directory):
    #         os.makedirs(directory)

    def add_user(self, user):
        self.users[user.uuid] = user
        self.save_users()
        print(f"Utilisateur ajouté: {user}")
    
    def save_users(self):
        with open(self.users_file, 'w') as f:
            json.dump([user.to_dict() for user in self.users.values()], f, indent=4)
        print(f"Utilisateurs sauvegardés dans {self.users_file}")
    
    def remove_user(self, user):
        if user.uuid in self.users:
            del self.users[user.uuid]
            print(f"Utilisateur supprimé: {user}")