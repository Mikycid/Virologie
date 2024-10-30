from dataManager.repository.userRepository import UserRepository
import logging
import ast
import re

class VpnModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "vpn_module"
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
            b"OPENVPN_CONFIGURATION_PLACEHOLDER": file_content
        })
        return result

    async def stop_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)
        return await user.execute("./modules/payloads/payload_stop_vpn.py")

    async def status_vpn(self, uuid):
        user = self.user_repository.get_user(uuid)

        response = await user.execute("./modules/payloads/payload_check_vpn_status.py")
        if isinstance(response, dict):
            return response
        try:
            logging.info("response: " + str(response))
            config_output, state_output = response.split("|||")
            config_output = ast.literal_eval(config_output)
            state_output = ast.literal_eval(state_output)
        except Exception as e:
            return {"error": f"Error parsing the output: {e}"}
        
        interface_regex = re.compile(r"^Configuration pour l'interface «(.+?)»")
        ip_regex = re.compile(r"Adresse IP\s*:\s*(\d+\.\d+\.\d+\.\d+)")

        state_regex = re.compile(r"^\s*(Activé|Désactivé)\s+(Connecté|Déconnecté)\s+\S+\s+(.+?)\s*$")

        current_interface = None
        interfaces = {}

        for line in config_output:
            if (interface_match := interface_regex.match(line)):
                current_interface = interface_match.group(1).strip()
                interfaces[current_interface] = {'IP': None, 'Connected': None}
                continue

            if current_interface and (ip_match := ip_regex.search(line)):
                interfaces[current_interface]['IP'] = ip_match.group(1)

        for line in state_output:
            if (state_match := state_regex.match(line)):
                admin_state, connection_state, name = state_match.groups()
                if name in interfaces:
                    interfaces[name]['Connected'] = connection_state == 'Connecté'

        filtered_interfaces = {interface: details['IP'] for interface, details in interfaces.items()
                       if details['Connected']}

        return filtered_interfaces