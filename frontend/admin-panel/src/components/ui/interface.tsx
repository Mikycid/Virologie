import {useState, useRef} from 'react';
import {Button} from "@/components/ui/shadcn/button.tsx";
import {ScrollArea} from "@/components/ui/shadcn/scroll-area.tsx";
import {User} from "@/Interfaces/User.ts";
import {KeyloggerButtons} from "@/components/ui/keylogger-buttons.tsx";

export default function Interface({selectedUser}: { selectedUser: User | null }) {
    const [output, setOutput] = useState<string[]>([]);
    const [selectedModule, setSelectedModule] = useState<string | null>(null);
    const [currentLine, setCurrentLine] = useState('');
    const scrollAreaRef = useRef<HTMLDivElement>(null);

    const typeOutput = (text: string): Promise<void> => {
        return new Promise((resolve) => {
            let index = 0;
            const interval = setInterval(() => {
                setCurrentLine(prev => prev + text[index]);
                index++;
                if (index === text.length) {
                    clearInterval(interval);
                    setOutput(prev => [...prev, text]);
                    setCurrentLine('');
                    resolve();
                }
            }, 25);
        });
    };

    const clearConsole = () => {
        setOutput([])
    };

    const executeCommand = (command: string) => {
        if (!selectedUser) {
            setOutput(prev => [...prev, '> No user selected. Please select a user.']);
            return;
        }

        setOutput(prev => [...prev, `> ${command} for user ${selectedUser.uuid}`]);
        setSelectedModule(command);
    };


    const commands = [
        {name: 'Keylogger', command: 'keylogger'},
        {name: 'Decrypt Database', command: 'decrypt_db'},
        {name: 'Launch Virus', command: 'launch_virus'},
        {name: 'Trace IP', command: 'trace_ip'},
        {name: 'Hack Mainframe', command: 'hack_mainframe'},
        {name: 'Delete Logs', command: 'delete_logs'},
    ];

    return (
        <div className="p-4">
            <header className="bg-green-900/50 p-4">
                <h1 className="text-2xl font-bold animate-pulse">Matrix Control Interface</h1>
            </header>
            <h2 className="text-xl font-semibold mb-4">System Commands</h2>
            <div className="grid grid-cols-2 gap-4 mb-4">
                {commands.map((cmd) => (
                    <Button
                        key={cmd.command}
                        onClick={() => executeCommand(cmd.command)}
                        className={
                            cmd.command === selectedModule ? "w-full border border-green-500 p-3 rounded-lg cursor-pointer bg-green-300 text-black animate-pulse shadow-lg shadow-green-500/50" : "w-full border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black  shadow-md shadow-green-500/50"
                        }
                    >
                        {cmd.name}
                    </Button>
                ))}
            </div>

            <h2 className="text-xl font-semibold mb-2">System Output</h2>
            <ScrollArea ref={scrollAreaRef} className="h-96 bg-black/50 p-4 overflow-y-auto border border-green-500 shadow-xl shadow-green-500/50">
                {output.map((line, index) => (
                    <p key={index} className="text-green-400">{line}</p>
                ))}
                <p className="text-green-400">{currentLine}</p>
            </ScrollArea>

            {
                selectedModule === 'keylogger' && (
                    <div className="mt-4">
                        <KeyloggerButtons typeOutput={(text: string) => typeOutput(text)} selectedUser={selectedUser} clearConsole={() => clearConsole()} setOutput={(value: React.SetStateAction<string[]>) => setOutput(value)} />
                    </div>
                )
            }
        </div>
    );
}
