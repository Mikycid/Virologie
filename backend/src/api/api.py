# api/api.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware  # Import CORS middleware
from api.routes.routes import router

# Function to create the FastAPI app with shared state
def create_app(app_state):
    app = FastAPI()
    app.state.app_state = app_state  # Store app_state in the app state for dependency injection

    # Add CORS middleware
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["http://localhost:5173"],  # Allows all origins; specify the frontend origin(s) here for security
        allow_credentials=True,
        allow_methods=["*"],  # Allow all HTTP methods (GET, POST, PUT, etc.)
        allow_headers=["*"],  # Allow all headers
    )

    app.include_router(router)
    return app
