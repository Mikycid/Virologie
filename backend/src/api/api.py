# api/api.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api.routes import user_router, vpn_router, keylogger_router, rdp_router, sensitive_files_router

def create_app(app_state):
    app = FastAPI()
    app.state.app_state = app_state

    # Add CORS middleware
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["http://localhost:5173", "http://localhost:3000"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # Include individual routers
    app.include_router(user_router)
    app.include_router(vpn_router)
    app.include_router(keylogger_router)
    app.include_router(rdp_router)
    app.include_router(sensitive_files_router)
    
    return app
