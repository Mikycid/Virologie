from fastapi import APIRouter, Depends, Request
from api.service.trollService import TrollService

router = APIRouter()

def get_troll_service(request: Request) -> TrollService:
    data_manager = request.app.state.app_state.data_manager
    return TrollService(data_manager.user_repository)

@router.get("/api/modules/troll/piano")
async def piano(id: str, troll_service: TrollService = Depends(get_troll_service)):
    return await troll_service.piano(id)

@router.get("/api/modules/troll/stop-piano")
async def stop_piano(id: str, troll_service: TrollService = Depends(get_troll_service)):
    return await troll_service.stop_piano(id)