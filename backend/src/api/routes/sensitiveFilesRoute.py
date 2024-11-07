# api/routes/sensitiveFilesRoute.py
from fastapi import APIRouter, Depends, Request
from api.service.sensitiveFilesService import SensitiveFilesService

router = APIRouter()

def get_sensitive_files_service(request: Request) -> SensitiveFilesService:
    data_manager = request.app.state.app_state.data_manager
    return SensitiveFilesService(data_manager.sensitive_files_module)

@router.get("/api/modules/sensitive-files")
async def get_sensitive_files(id: str, sensitive_files_service: SensitiveFilesService = Depends(get_sensitive_files_service)):
    return await sensitive_files_service.activate(id)