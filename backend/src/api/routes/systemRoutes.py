from fastapi import APIRouter, Depends, Request
from api.service.systemService import SystemService

router = APIRouter()

def get_system_service(request: Request) -> SystemService:
    data_manager = request.app.state.app_state.data_manager
    return SystemService(data_manager.system_module)

@router.get("/api/modules/system/list-processes")
async def list_processes(id: str, system_service: SystemService = Depends(get_system_service)):
    return await system_service.list_processes(id)