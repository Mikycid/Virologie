import { Module } from '@/Interfaces/Module';
import { vpnModule } from './vpnModule';
import { User } from '@/Interfaces/User';
import { crackingModule } from './crackingModule';
import { keyloggerModule } from './keyloggerModule';
import { rdpModule } from './rdpModule';
import { exploitModule } from './exploitModule';
import { systemModule } from './systemModule';
import { trollModule } from './trollModule';
import { adModule } from './adModule';

const modules: Record<string, Module> = {};

export interface ParsedCommand {
    moduleName: string;
    commandName: string;
    args: Record<string, string | boolean>;
    rawInput: string;
}

export function getModules() {
    return modules;
}

function moduleHelp(moduleName :string, addOutput: (message: string) => void) {
    const module = modules[moduleName];
    if (!module) {
        addOutput(`Unknown module: ${moduleName}. Try /help for available modules.`);
        return;
    }
    addOutput(`Commands for ${moduleName}:`);
    for(const command of Object.keys(module.commands)) {
        addOutput(`- ${command}`);
    }
}

export const registerModule = (name: string, module: Module) => {
    modules[name] = module;
};

export const parseCommand = (input: string): ParsedCommand => {
    // Remove leading/trailing whitespace
    input = input.trim();
    
    // Split the input into parts
    const parts = input.split('/');
    if (parts.length < 2) {
        throw new Error('Invalid command format. Expected /module/command');
    }
    if (parts.length > 3) {
        if (parts[parts.length - 1] === 'help') {
            return {
                moduleName: parts[1],
                commandName: parts[2],
                args: {'help': true},
                rawInput: input
            };
        }
        throw new Error('Invalid command format. Too many parts');
    }

    // Get module and command parts
    const [, moduleName, commandWithArgs] = parts;
    if (!moduleName || !commandWithArgs) {
        throw new Error('Invalid command format. Expected /module/command');
    }

    // Split command and arguments
    const cmdParts = commandWithArgs.split(':');
    const commandName = cmdParts[0];

    // Parse arguments
    const args: Record<string, string | boolean> = {};
    
    // Process all parts after the command name as arguments
    for (let i = 1; i < cmdParts.length; i++) {
        const arg = cmdParts[i];
        if (!arg) continue;

        if (arg.includes('=')) {
            // Handle key=value pairs
            const [key, value] = arg.split('=');
            if (key) {
                args[key] = value || '';
            }
        } else {
            // Handle flag-style arguments
            args[arg] = true;
        }
    }

    return {
        moduleName,
        commandName,
        args,
        rawInput: input
    };
};

export const executeCommand = (
    user: User, 
    input: string, 
    addOutput: (message: string) => void
) => {
    try {
        if (input.match(/^\/?help$/)) {
            showGlobalHelp(addOutput);
            return;
        }
        const parsed = parseCommand(input);
        
        if (parsed.moduleName === 'help') {
            showGlobalHelp(addOutput);
            return;
        }

        const module = modules[parsed.moduleName];
        if (!module) {
            addOutput(`Unknown module: ${parsed.moduleName}. Try /help for available modules.`);
            return;
        }

        if (parsed.commandName === 'help') {
            for (const line of module.help.split('\n')) {
                addOutput(line);
            }
            moduleHelp(parsed.moduleName, addOutput);
            return;
        }
        const command = module.commands[parsed.commandName.trim()];
        if (!command) {
            addOutput(`Unknown command in ${parsed.moduleName}: ${parsed.commandName}`);
            addOutput(`Use /${parsed.moduleName}/help for module details`);
            return;
        }

        if (parsed.args['help']) {
            for (const line of command.help.split('\n')) {
                addOutput(line);
            }
        } else {
            
            command.execute(user, parsed.args, addOutput);
        }
    } catch (error:any) {
        addOutput(`Error executing command: ${error.message}`);
    }
};

// Function to show global help
export const showGlobalHelp = (addOutput: (message: string) => void) => {
    addOutput("Available modules:");
    Object.keys(modules).forEach((moduleName) => addOutput(`- ${moduleName}`));
    addOutput(`Use /[module]/help for module details`);
};


// Initialize commands for modules
export const initializeModules = () => {
    registerModule('vpn', vpnModule);
    registerModule('cracking', crackingModule);
    registerModule('keylogger', keyloggerModule);
    registerModule('rdp', rdpModule);
    registerModule('exploit', exploitModule);
    registerModule('system', systemModule);
    registerModule('troll', trollModule);
    registerModule('ad', adModule);
};


