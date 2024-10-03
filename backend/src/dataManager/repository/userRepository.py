import os
import json
from classes.user import User
from dotenv import load_dotenv
import logging

load_dotenv()

class UserRepository:
    def __init__(self):
        # Define the path to the user directory where individual user files will be stored
        self.users_dir = os.path.join(os.getenv('STORAGE_PATH'), 'users')
        self.ensure_data_directory_exists()
        self.users = self.load_users()
        
    def load_users(self):
        """
        Load all user files from the user directory and create User objects.
        
        Returns:
            dict: A dictionary mapping user UUIDs to User objects.
        """
        self.ensure_data_directory_exists()
        users = {}
        # Iterate through all JSON files in the users directory
        for filename in os.listdir(self.users_dir):
            if filename.endswith('.json'):
                filepath = os.path.join(self.users_dir, filename)
                try:
                    with open(filepath, 'r') as f:
                        user_data = json.load(f)
                        user = User.from_dict(user_data)
                        users[user.uuid] = user
                except (FileNotFoundError, json.JSONDecodeError):
                    print(f"Erreur lors du chargement de l'utilisateur: {filename}")
        if not users:
            print("Aucun utilisateur existant à charger.")
        return users
    
    def ensure_data_directory_exists(self):
        """Ensure the user data directory exists."""
        if not os.path.exists(self.users_dir):
            os.makedirs(self.users_dir)

    def add_user(self, user):
        """Add a new user and save them as an individual JSON file."""
        self.users[user.uuid] = user
        self.save_user(user)
        print(f"Utilisateur ajouté: {user}")

    def get_user(self, uuid) -> User:
        """Retrieve a user by UUID."""
        return self.users.get(uuid)
    
    def get_users(self):
        """Retrieve all users."""
        return [x.to_dict() for x in list(self.users.values())]
    
    def set_user_module_data(self, uuid, module_name, data):
        """Set module-specific data for a user."""
        user = self.get_user(uuid)
        if user:
            user.set_module_data(module_name, data)
            self.save_user(user)
            print(f"Données du module {module_name} définies pour {user}")
        else:
            print(f"Impossible de définir les données du module {module_name} pour l'utilisateur {uuid}: utilisateur introuvable.")
    
    def save_user(self, user: User):
        """Save a single user to a separate JSON file."""
        filepath = os.path.join(self.users_dir, f"{user.uuid}.json")
        with open(filepath, 'w') as f:
            json.dump(user.to_dict(), f)
        print(f"Utilisateur sauvegardé dans {filepath}")

    def save_users(self):
        """Save all users individually."""
        for user in self.users.values():
            self.save_user(user)
        print(f"Tous les utilisateurs ont été sauvegardés dans {self.users_dir}")
    
    def remove_user(self, user):
        """Remove a user both from memory and from the filesystem."""
        if user.uuid in self.users:
            del self.users[user.uuid]
            filepath = os.path.join(self.users_dir, f"{user.uuid}.json")
            if os.path.exists(filepath):
                os.remove(filepath)
                print(f"Fichier utilisateur supprimé: {filepath}")
            print(f"Utilisateur supprimé: {user}")
