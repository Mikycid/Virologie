from dataManager.repository.userRepository import UserRepository
import logging

class VpnManager:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "vpn_manager"
        self.user_repository: UserRepository = user_repository

    async def install_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
        logging.info(f"Installing vpn for user with uuid {uuid}")
        result = await user.execute("./modules/payloads/payload_install_vpn.py")
        logging.info("result: " + result)
        return {"message": result}

    async def connect_to_vpn(self, uuid):
        
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
        logging.info(f"Connecting to vpn for user with uuid {uuid}")
        result = await user.execute("./modules/payloads/payload_connect_to_vpn.py")
        return {"message": result}

    async def stop_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)
        await user.execute("./modules/payloads/payload_stop_vpn.py")