import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';

const piano: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("User can soon play piano mouahahaha!");
        const response = await fetch("http://localhost:8000/api/modules/troll/piano?id=" + user.uuid);
        if (!response.ok) {
            addOutput("Failed to play piano.");
            return
        }
        addOutput("Real music is coming!");
    },
    help: "Make the victim's keyboard turn into a piano. Usage: /troll/piano"
};

const stopPiano: Command = {
    execute: async (user, args, addOutput) => {
        addOutput("Stopping the piano...");
        const response = await fetch("http://localhost:8000/api/modules/troll/stop-piano?id=" + user.uuid);
        if (!response.ok) {
            addOutput("Failed to stop the piano.");
            return
        }
        addOutput("Piano stopped.");
    },
    help: "Stop the piano. Usage: /troll/stop-piano"
};

export const trollModule: Module = {
    commands: {piano, stopPiano},
    help: `This module is to troll the victim.\n`
};