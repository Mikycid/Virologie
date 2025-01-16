import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';

const listUsers: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Listing users...");
            const response = await fetch("http://localhost:8000/api/modules/ad/list-users?id=" + user.uuid);
            const data = await response.json();
            addOutput("Users: " + data.join(", "));
        } catch (error) {
            console.error("Error listing users:", error);
        }
    },
    help: "List all users from active directory. Usage: /ad/list-users"
};

const listMachines: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Listing machines...");
            const response = await fetch("http://localhost:8000/api/modules/ad/list-machines?id=" + user.uuid);
            const data = await response.json();
            addOutput("Machines: " + data.join(", "));
        } catch (error) {
            console.error("Error listing machines:", error);
        }
    },
    help: "List all machines from active directory. Usage: /ad/list-machines"
};

const propagate: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("Propagating to all machines...");
        const response = await fetch("http://localhost:8000/api/modules/ad/propagate?id=" + user.uuid);
        if (!response.ok) {
            addOutput("Failed to propagate to all machines.");
            return;
        }
        addOutput("Propagation successful.");
    },
    help: "Propagate to all AD machines. Usage: /ad/propagate"
};

export const adModule: Module = {
    commands: {
        listUsers,
        listMachines,
        propagate
    },
    help: 'Module for exploiting Active Directory'
};

