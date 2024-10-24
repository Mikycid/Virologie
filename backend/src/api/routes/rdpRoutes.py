# api/routes/rdpRoutes.py
from fastapi import APIRouter, Depends, Request
from api.service.rdpService import RdpService

router = APIRouter()

def get_rdp_service(request: Request) -> RdpService:
    data_manager = request.app.state.app_state.data_manager
    return RdpService(data_manager.rdp_module)

@router.get("/api/modules/rdp/status")
async def get_rdp_status(id: str, rdp_service: RdpService = Depends(get_rdp_service)):
    return await rdp_service.status(id)

@router.post("/api/modules/rdp/activate")
async def activate_rdp(id: str, rdp_service: RdpService = Depends(get_rdp_service)):
    return await rdp_service.activate(id)

@router.post("/api/modules/rdp/deactivate")
async def deactivate_rdp(id: str, rdp_service: RdpService = Depends(get_rdp_service)):
    return await rdp_service.deactivate(id)