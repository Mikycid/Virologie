# api/routes/userRoutes.py
from fastapi import APIRouter, Depends, Request
from api.service.userService import UserService

router = APIRouter()

def getUserService(request: Request) -> UserService:
    data_manager = request.app.state.app_state.data_manager
    return UserService(data_manager.user_repository, data_manager.lock)

@router.get("/api/users")
async def getAllUsers(user_service: UserService = Depends(getUserService)):
    return user_service.getUsers()

@router.get("/api/shell/{id}")
async def execute_python_shell(id: str, command: str, user_service: UserService = Depends(getUserService)):
    return await user_service.executePythonShell(id, command)
