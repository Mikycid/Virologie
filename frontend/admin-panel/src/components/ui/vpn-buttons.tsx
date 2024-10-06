import React from 'react';
import { User } from "@/Interfaces/User.ts";

export function VPNButtons (
{
    typeOutput,
    selectedUser,
    clearConsole,
    setOutput
}: {
    typeOutput: (text: string) => Promise<void>,
    selectedUser: User | null,
    clearConsole: () => void,
    setOutput: (value: React.SetStateAction<string[]>) => void
}) {

    const startVPN = async () => {
        await typeOutput("> Starting VPN, please wait...")
        await fetch("http://localhost:8000/api/modules/vpn/start?id=" + selectedUser?.uuid);
        await typeOutput("> VPN installed.");
    };

    const stopVPN = async () => {
        await typeOutput("> Stopping VPN, please wait...")
        await fetch("http://localhost:8000/api/modules/vpn/stop?id=" + selectedUser?.uuid);
        await typeOutput("> VPN stopped.");
    };

    const installVPN = async () => {
        await typeOutput("> Installing VPN, please wait...")
        await fetch("http://localhost:8000/api/modules/vpn/install?id=" + selectedUser?.uuid);
        await typeOutput("> VPN installed.");
    };

    return (
        <div className="mr-4 space-y-4 text-green-500 h-1/2">
            <button 
                onClick={async ()=>await installVPN()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Install VPN</p>
            </button>
            
            <button
                onClick={async () => await startVPN()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Start VPN</p>
            </button>

            <button
                onClick={async () => await stopVPN()}
                className="p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Stop VPN</p>
            </button>
        </div>
    );
};

export default VPNButtons;
