import { Module } from '@/Interfaces/Module';
import { vpnModule } from './vpnModule';
import { User } from '@/Interfaces/User';
import { crackingModule } from './crackingModule';
import { keyloggerModule } from './keyloggerModule';
import { rdpModule } from './rdpModule';
import { exploitModule } from './exploitModule';

const modules: Record<string, Module> = {};

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

export const executeCommand = (user: User, input: string, addOutput: (message: string) => void) => {
    const parts = input.split('/');
    const [moduleName, commandName, subCommand] = parts.slice(1);

    if (moduleName === 'help') {
        showGlobalHelp(addOutput);
        return;
    }

    const module = modules[moduleName];

    if (!module) {
        addOutput(`Unknown module: ${moduleName}. Try /help for available modules.`);
        return;
    }

    if(commandName === 'help') {
        for (const line of module.help.split('\n')) {
            addOutput(`${line}`);
        }
        moduleHelp(moduleName, addOutput);
        return;
    }

    const command = module.commands[commandName];
    if (!command) {
        addOutput(`Unknown command in ${moduleName}: ${commandName}`);
        addOutput(`Use /${moduleName}/help for module details`);
        return;
    }

    if (subCommand === 'help') {
        for (const line of command.help.split('\n')) {
            addOutput(`${line}`);
        }
    } else {
        command.execute(user, parts.slice(2), addOutput);
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
};


