from modules.SensitiveFilesModule import SensitiveFilesModule
from fastapi import HTTPException
import ast

class SensitiveFilesService:
    def __init__(self, sensitiveFilesModule: SensitiveFilesModule) -> None:
        self.sensitiveFilesModule = sensitiveFilesModule

    async def activate(self, id: str):

        response = await self.sensitiveFilesModule.retrieve(id)
        try:
#             file_list = ast.literal(response)
            print(response)
        except:
            raise HTTPException(status_code=500, detail="Error while retrieving sensitive files.")

        return response