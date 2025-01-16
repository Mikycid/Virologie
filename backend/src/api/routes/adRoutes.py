from fastapi import APIRouter, Depends, Query, Request, UploadFile, File
from api.service.adService import ADService

router = APIRouter()

def get_ad_service(request: Request) -> ADService:
    data_manager = request.app.state.app_state.data_manager
    return ADService(data_manager.ad_module, data_manager.user_repository)

@router.get("/api/modules/ad/list-users")
async def list_users(id: str = Query(None), ad_service: ADService = Depends(get_ad_service)):
    return await ad_service.list_users(id)

@router.get("/api/modules/ad/list-machines")
async def list_machines(id: str = Query(None), ad_service: ADService = Depends(get_ad_service)):
    return await ad_service.list_machines(id)

@router.get("/api/modules/ad/propagate")
async def propagate(id: str = Query(None), ad_service: ADService = Depends(get_ad_service)):
    return await ad_service.propagate(id)