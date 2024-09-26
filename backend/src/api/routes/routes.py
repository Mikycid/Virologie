from fastapi import APIRouter
from helper.fileManager import FileManager
from service.userService import UserService

router = APIRouter()

@router.get("/users")
async def getAllUsers():
    return UserService.getUsers()