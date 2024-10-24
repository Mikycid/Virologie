# api/routes/vpnRoutes.py
from fastapi import APIRouter, Depends, Query, UploadFile, File
from api.service.vpnService import VpnService
from typing import Optional
from fastapi import Request

router = APIRouter()

def getVpnService(request: Request) -> VpnService:
    data_manager = request.app.state.app_state.data_manager
    return VpnService(data_manager.vpn_module)

@router.get("/api/modules/vpn/install")
async def install_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    return await vpn_service.install_vpn(id)

@router.get("/api/modules/vpn/uninstall")
async def uninstall_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    return await vpn_service.uninstall_vpn(id)

@router.post("/api/modules/vpn/connect")
async def connect_to_vpn(
    file: UploadFile = File(...),
    id: Optional[str] = None,
    vpn_service: VpnService = Depends(getVpnService)
):
    config_content = await file.read()
    return await vpn_service.connect_to_vpn(id, config_content)

@router.get("/api/modules/vpn/stop")
async def stop_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    return await vpn_service.stop_vpn(id)

@router.get("/api/modules/vpn/status")
async def status_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    return await vpn_service.status_vpn(id)
