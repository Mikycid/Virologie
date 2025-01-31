# api/routes/userRoutes.py
from fastapi import APIRouter, Depends, Request, Query
from api.service.userService import UserService
from pydantic import BaseModel

router = APIRouter()

def getUserService(request: Request) -> UserService:
    data_manager = request.app.state.app_state.data_manager
    return UserService(data_manager.user_repository, data_manager.lock)

@router.get("/api/users")
async def getAllUsers(user_service: UserService = Depends(getUserService)):
    return user_service.getUsers()


class CommandRequest(BaseModel):
    command: str
    id: str

@router.post("/api/shell")
async def execute_python_shell(
    command_request: CommandRequest,
    user_service: UserService = Depends(getUserService)
):
    command = command_request.command
    id = command_request.id
    return await user_service.executePythonShell(id, command)