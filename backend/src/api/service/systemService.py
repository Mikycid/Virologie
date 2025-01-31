from modules.SystemModule import SystemModule
from dataManager.repository.userRepository import UserRepository
from fastapi import HTTPException

class SystemService:
    def __init__(self, system_module: SystemModule, user_repository: UserRepository):
        self.system_module = system_module
        self.user_repository = user_repository

    async def list_processes(self, uuid: str):
        return await self.system_module.list_processes(uuid)
    
    async def use_active_session(self, uuid: str):
        return await self.system_module.use_active_session(uuid)
    
    async def getUserSessions(self, user_id):
        user = self.user_repository.get_user(user_id)
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        
        return {
            "active_session": user.username,
            "sessions": [x.username for x in user.standby_sessions]
        }
    
    async def changeSession(self, user_id, session):
        user = self.user_repository.get_user(user_id)
        
        if not user:
            raise HTTPException(status_code=404, detail="User not found")

        if user.username == session:
            raise HTTPException(status_code=400, detail="User is already in the selected session")

        for standby_session in user.standby_sessions:
            if standby_session.username == session:
                user.standby_sessions.remove(standby_session)
                user.standby_sessions.append(user)
                
                new_active_user = standby_session
                
                self.user_repository.switch_user(user.uuid, new_active_user)

                return {
                    "message": "Session changed successfully. Reload the page to see the changes (you can use the features without reloading)."
                }
        
        raise HTTPException(status_code=404, detail="Session not found")
