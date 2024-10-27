from fastapi import HTTPException
from modules.VpnModule import VpnModule

class VpnService:
    def __init__(self, vpnModule: VpnModule):
        self.vpnModule = vpnModule

    async def _handle_result(self, result: str | dict, action: str) -> dict:
        """
        Handle the result from VPN operations.

        Args:
            result (str | dict): The result from the VPN operation.
            action (str): The action performed (for error messages).

        Raises:
            HTTPException: If an error occurs during the operation.

        Returns:
            dict: The processed result.
        """
        if isinstance(result, str):
            if "error" in result or "Exception" in result:
                raise HTTPException(
                    status_code=500, detail=f"Error during {action}: {result}"
                )
            return {"message": result}
        elif isinstance(result, dict) and "error" in result:
            raise HTTPException(
                status_code=500, detail=f"Error during {action}: {result['error']}"
            )
        return result

    async def install_vpn(self, uuid: str) -> dict:
        """
        Install VPN for a user.

        Args:
            uuid (str): The user UUID for whom the VPN should be installed.

        Returns:
            dict: The result of the VPN installation.
        """
        try:
            result = await self.vpnModule.install_vpn(uuid)
            return await self._handle_result(result, "installation")
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error during installation: {str(e)}")

    async def uninstall_vpn(self, uuid: str) -> dict:
        """
        Uninstall VPN for a user.

        Args:
            uuid (str): The user UUID for whom the VPN should be uninstalled.

        Returns:
            dict: The result of the VPN uninstallation.
        """
        try:
            await self.vpnModule.stop_vpn(uuid)
            result = await self.vpnModule.uninstall_vpn(uuid)
            return await self._handle_result(result, "uninstallation")
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error during uninstallation: {str(e)}")

    async def connect_to_vpn(self, uuid: str, config_content: bytes) -> dict:
        """
        Connect to the VPN using the provided configuration content.

        Args:
            uuid (str): The user UUID for the VPN connection.
            config_content (bytes): The VPN configuration file content.

        Returns:
            dict: The result of the VPN connection attempt.
        """
        try:
            result = await self.vpnModule.connect_to_vpn(uuid, config_content)
            return await self._handle_result(result, "connection")
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error during connection: {str(e)}")

    async def stop_vpn(self, uuid: str) -> dict:
        """
        Stop the VPN connection for the user.

        Args:
            uuid (str): The user UUID for whom the VPN should be stopped.

        Returns:
            dict: The result of stopping the VPN.
        """
        try:
            result = await self.vpnModule.stop_vpn(uuid)
            return await self._handle_result(result, "stopping")
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error during stopping: {str(e)}")

    async def status_vpn(self, uuid: str) -> dict:
        """
        Get the status of the VPN connection for the user.

        Args:
            uuid (str): The user UUID for whom the VPN status is requested.

        Returns:
            dict: The result of the VPN status.
        """
        try:
            result = await self.vpnModule.status_vpn(uuid)
            return await self._handle_result(result, "status check")
        except Exception as e:
            raise HTTPException(status_code=400, detail=f"Error during status check: {str(e)}")
