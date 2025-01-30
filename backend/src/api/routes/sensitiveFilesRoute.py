from fastapi import APIRouter, Depends, Request
from api.service.sensitiveFilesService import SensitiveFilesService

sensitive_files_router = APIRouter()


def get_sensitive_files_service(request: Request) -> SensitiveFilesService:
    data_manager = request.app.state.app_state.data_manager
    return SensitiveFilesService(data_manager.sensitive_files_module)


@sensitive_files_router.get("/api/modules/sensitive-files/list")
async def list_sensitive_files(id: str,
                              sensitive_files_service: SensitiveFilesService = Depends(get_sensitive_files_service)):
    return await sensitive_files_service.list(id)

@sensitive_files_router.get("/api/modules/sensitive-files/retrieve")
async def retrieve_sensitive_files(id: str, filename: str, sensitive_files_service: SensitiveFilesService = Depends(get_sensitive_files_service)):
    return await sensitive_files_service.retrieve(id, filename)