import {useRef, useState} from 'react';
import {Button} from "@/components/ui/shadcn/button.tsx";
import {ScrollArea} from "@/components/ui/shadcn/scroll-area.tsx";
import {User} from "@/Interfaces/User.ts";
import {KeyloggerButtons} from "@/components/ui/keylogger-buttons.tsx";
import {VPNButtons} from "@/components/ui/vpn-buttons.tsx";
import {Input} from "@/components/ui/shadcn/input.tsx";

export default function Interface({selectedUser, selectedModule, setSelectedModule}: { selectedUser: User | null, selectedModule: string ,setSelectedModule: (module: string) => void }) {
    const [output, setOutput] = useState<string[]>([]);

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
        {name: 'VPN', command: 'vpn'},
        {name: 'Launch Virus', command: 'launch_virus'},
        {name: 'Trace IP', command: 'trace_ip'},
        {name: 'Hack Mainframe', command: 'hack_mainframe'},
        {name: 'Delete Logs', command: 'delete_logs'},
    ];

    return (
        <div className="p-4 h-full">
            <header className="bg-green-900/50 p-2 my-4">
                <h1 className="text-2xl font-bold animate-pulse text-center">System Commands</h1>
            </header>
            <div className="grid grid-cols-2 gap-3">
                {
                    commands.map((cmd) => (
                        <Button
                            key={cmd.command}
                            onClick={() => executeCommand(cmd.command)}
                            className={
                                cmd.command === selectedModule ? "w-full border border-green-500 p-3 rounded-lg cursor-pointer bg-green-300 text-black animate-pulse shadow-lg shadow-green-500/50" : "w-full border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black  shadow-md shadow-green-500/50"
                            }
                        >
                            {cmd.name}
                        </Button>
                    ))
                }
            </div>
            <div className="flex justify-center mb-4 h-16">
                {
                    selectedModule === 'keylogger' && (
                        <div>
                            <KeyloggerButtons typeOutput={(text: string) => typeOutput(text)} selectedUser={selectedUser}
                                              clearConsole={() => clearConsole()}
                                              setOutput={(value: React.SetStateAction<string[]>) => setOutput(value)}/>
                        </div>
                    )
                }
                {
                    selectedModule === 'vpn' && (
                        <div>
                            <VPNButtons typeOutput={(text: string) => typeOutput(text)} selectedUser={selectedUser}
                                        clearConsole={() => clearConsole()}
                                        setOutput={(value: React.SetStateAction<string[]>) => setOutput(value)}/>
                        </div>
                    )
                }
            </div>
            <div className="h-96">
                <ScrollArea ref={scrollAreaRef}
                            className="h-[32rem] bg-black/50 p-4 overflow-y-auto border border-green-500 shadow-xl shadow-green-500/50 mt-2">
                    {
                        output.map((line, index) => (
                            <p key={index} className="text-green-400">{line}</p>
                        ))
                    }
                    <p className="text-green-400">{currentLine}</p>
                </ScrollArea>
            </div>
            <div className="flex justify-center align-middle mt-36">
                <Input className="dark border border-green-500"/>
                <div className="border border-green-500 rounded">
                    <svg xmlns="http://www.w3.org/2000/svg" width="38"
                         height="38" viewBox="0 0 24 24" stroke-width="1.5" stroke="#22C55E" fill="none"
                         stroke-linecap="round"
                         stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <path
                            d="M4.698 4.034l16.302 7.966l-16.302 7.966a.503 .503 0 0 1 -.546 -.124a.555 .555 0 0 1 -.12 -.568l2.468 -7.274l-2.468 -7.274a.555 .555 0 0 1 .12 -.568a.503 .503 0 0 1 .546 -.124z"/>
                        <path d="M6.5 12h14.5"/>
                    </svg>
                </div>
            </div>
        </div>
    );
}
