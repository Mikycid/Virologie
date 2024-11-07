# api/routes/__init__.py
from api.routes.userRoutes import router as user_router
from api.routes.vpnRoutes import router as vpn_router
from api.routes.keyloggerRoutes import router as keylogger_router
from api.routes.rdpRoutes import router as rdp_router
from api.routes.sensitiveFilesRoute import router as sensitive_files_router
from api.routes.crackRoutes import router as crack_router