from dataManager.repository.userRepository import UserRepository
import logging
import ast

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
        return result
    
    async def uninstall_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
        logging.info(f"Installing vpn for user with uuid {uuid}")
        result = await user.execute("./modules/payloads/payload_uninstall_vpn.py")
        return result

    async def connect_to_vpn(self, uuid, file_content):
        
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error(f"User with uuid {uuid} not found")
            return
        logging.info(f"Connecting to vpn for user with uuid {uuid}")
        result = await user.execute("./modules/payloads/payload_connect_to_vpn.py", {
            "OPENVPN_CONFIGURATION_PLACEHOLDER": file_content
        })
        return result

    async def stop_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)
        return await user.execute("./modules/payloads/payload_stop_vpn.py")

    async def status_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)

        excluded_interfaces = ["Wi-Fi", "WSL", "Loopback", "Ethernet"]
        
        # Execute the Python script and get the interfaces
        interfaces = await user.execute("./modules/payloads/payload_check_vpn_status.py")
        try:
            interfaces_dict: dict = ast.literal_eval(interfaces)
        except SyntaxError as err:
            return {
                "error": err
            }
        # Filter out the excluded interfaces
        filtered_interfaces = {interface: ip for interface, ip in interfaces_dict.items() 
                            if all(excluded not in interface for excluded in excluded_interfaces)}
        logging.info(filtered_interfaces)
        return filtered_interfaces