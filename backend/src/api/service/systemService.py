from modules.SystemModule import SystemModule

class SystemService:
    def __init__(self, system_module: SystemModule):
        self.system_module = system_module

    async def list_processes(self, uuid: str):
        return await self.system_module.list_processes(uuid)