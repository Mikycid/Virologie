import asyncio
from .user import User
import logging

class Agent:
    def __init__(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter, user: User, pid: int):
        self.reader = reader
        self.writer = writer
        self.user = user
        self.pid = pid
        self.event = asyncio.Event()

    async def handle(self):
        await self.event.wait()

    async def execute(self, content: str, final_character=b""):
        self.writer.write(content.encode())
        await self.writer.drain()

        # Reading unlimited output in chunks
        output = b""
        while True:
            chunk = await self.agents[0].read(4096)
            if not chunk:  # End of stream
                break
            
            output += chunk

            # Check if the output ends with the final_character
            if output.endswith(final_character):
                logging.info(f"Final character {final_character} encountered, stopping reading.")
                break

        decoded_output = output.decode()
        logging.info(f"Output for {self.ip}: {decoded_output}")
        
        self.event.set()


