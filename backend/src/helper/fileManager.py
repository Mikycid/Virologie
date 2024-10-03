import os
from dotenv import load_dotenv
load_dotenv()

class FileManager:
    def __init__(self) -> None:
        self.files_path =  os.getenv('FILES_PATH')
        self.ensure_data_directory_exists()
        
    def ensure_data_directory_exists(self):
        directory = os.path.dirname(self.files_path)
        if not os.path.exists(directory):
            os.makedirs(directory)

    def read(self, resource_path) -> str:
        try:
            with open(self.files_path + resource_path, 'r') as file:
                return file.read()
        except FileNotFoundError:
            print('File not found')
            return None

    # def write(self, data: str) -> None:
    #     with open(self.path, 'w') as file:
    #         file.write(data)