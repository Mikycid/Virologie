# api/routes/crackRoutes.py
from fastapi import APIRouter, Depends, Query, Request, UploadFile, File
from api.service.crackService import CrackService

router = APIRouter()

def get_crack_service(request: Request) -> CrackService:
    data_manager = request.app.state.app_state.data_manager
    return CrackService(data_manager.crack_module, data_manager.user_repository)

@router.get("/api/modules/cracking/retrieve-ntlm")
async def start_crack(id: str = Query(None), crack_service: CrackService = Depends(get_crack_service)):
    return await crack_service.retrieve_ntlm(id)

@router.post("/api/modules/cracking/crack-ntlm")
async def crack(
    id: str = Query(None),
    wordlist: UploadFile = File(...), 
    crack_service: CrackService = Depends(get_crack_service)
):
    wordlist_content = await wordlist.read()
    return await crack_service.crack(id, wordlist_content)

@router.get("/api/modules/cracking/old-passwords")
async def old_passwords(id: str = Query(None), crack_service: CrackService = Depends(get_crack_service)):
    return await crack_service.old_passwords(id)
