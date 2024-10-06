from modules.VpnManager import VpnManager
class VpnService:
    def __init__(self, vpnModule: VpnManager):
        self.vpnModule = vpnModule

    async def install_vpn(self, uuid):
        return await self.vpnModule.install_vpn(uuid)
    
    async def connect_to_vpn(self, uuid):
        return await self.vpnModule.connect_to_vpn(uuid)
    
    async def stop_vpn(self, uuid):
        return await self.vpnModule.stop_vpn(uuid)