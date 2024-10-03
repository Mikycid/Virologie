# api/api.py
from fastapi import FastAPI
from api.routes.routes import router

# Function to create the FastAPI app with shared state
def create_app(app_state):
    app = FastAPI()
    app.state.app_state = app_state  # Store app_state in the app state for dependency injection
    app.include_router(router)
    return app
