from fastapi import APIRouter, Depends, Request, Query
from api.service.systemService import SystemService

router = APIRouter()

def get_system_service(request: Request) -> SystemService:
    data_manager = request.app.state.app_state.data_manager
    return SystemService(data_manager.system_module, data_manager.user_repository)

@router.get("/api/modules/system/list-processes")
async def list_processes(id: str, system_service: SystemService = Depends(get_system_service)):
    return await system_service.list_processes(id)

@router.get("/api/modules/system/use-active-session")
async def use_active_session(id: str, system_service: SystemService = Depends(get_system_service)):
    return await system_service.use_active_session(id)

@router.get("/api/modules/system/sessions")
async def getUserSessions(
    id: str = Query(...),
    system_service: SystemService = Depends(get_system_service)
):
    return await system_service.getUserSessions(id)

@router.get("/api/modules/system/change-session")
async def changeSession(
    id: str = Query(...),
    session: str = Query(...),
    system_service: SystemService = Depends(get_system_service)
):
    return await system_service.changeSession(id, session)