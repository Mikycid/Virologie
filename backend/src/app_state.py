# app_state.py

import asyncio

class AppState:
    def __init__(self, data_manager):
        self.data_manager = data_manager
        self.lock = asyncio.Lock()
