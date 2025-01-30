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

export const systemModule: Module = {
    commands: {
        listProcesses,
    },
    help: `This module is to get informations about the victim's system.\n`
};