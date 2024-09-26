import uuid
from datetime import datetime

class User:
    def __init__(self, uuid, ip, port, reader=None, writer=None):
        self.uuid = uuid
        self.ip = ip
        self.port = port
        self.connection_time = datetime.now().astimezone().strftime("%Y-%m-%d %H:%M:%S %Z")
        self.reader = reader
        self.writer = writer
        
        

    def __repr__(self):
        return f"{self.ip}:{self.port}"
    
    def to_dict(self):
        return {
            'uuid': self.uuid,
            'ip': self.ip,
            'port': self.port,
            'connection_time': self.connection_time,
        }

    @classmethod
    def from_dict(cls, data):
        user = cls(data['ip'], data['port'], data['uuid'])
        user.connection_time = data['connection_time']
        return user
    
    async def execute(self, file_path):
        # Commande PowerShell pour exécuter le fichier Python
        command = f"python3 {file_path}"
        # Envoi de la commande au client
        self.writer.write(command.encode())
        await self.writer.drain()
        
        # Lecture de la sortie de la commande
        output = await self.reader.read(1024 * 128)  # Lire jusqu'à 128KB
        return output.decode()