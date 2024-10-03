import { useState, useRef } from 'react'
import { Button } from "@/components/ui/shadcn/button.tsx"
import { ScrollArea } from "@/components/ui/shadcn/scroll-area.tsx"

export default function Interface() {
    const [output, setOutput] = useState<string[]>([])
    const [currentLine, setCurrentLine] = useState('')
    const scrollAreaRef = useRef<HTMLDivElement>(null)

    const typeOutput = (text: string): Promise<void> => {
        return new Promise((resolve) => {
            let index = 0
            const interval = setInterval(() => {
                setCurrentLine(prev => prev + text[index])
                index++
                if (index === text.length) {
                    clearInterval(interval)
                    setOutput(prev => [...prev, text])
                    setCurrentLine('')
                    resolve()
                }
            }, 25)
        })
    }

    const executeCommand = (command: string) => {
        setOutput(prev => [...prev, `> ${command}`])
        typeOutput(`Executing: ${command}...`)
            .then(async () => typeOutput(await getCommandOutput(command)))
            .then(() => typeOutput('Operation complete.'))
    }


    const getCommandOutput = async (command: string): Promise<string> => {
        switch (command) {
            case 'keylogger':
                const fetchKeyloggerData = async () => {
                    try {
                        const response = await fetch('https://your-api-endpoint.com/keylogger');
                        const data = await response.json();
                        setOutput(prev => [...prev, `Keylogger data: ${JSON.stringify(data)}`]);
                    } catch (error: any) {
                        setOutput(prev => [...prev, `Error fetching keylogger data: ${error.message}`]);
                    }
                };
                await fetchKeyloggerData(); // Initial fetch
                const intervalId = setInterval(fetchKeyloggerData, 2000); // Fetch every 2 seconds

                // Clear the interval when the component unmounts or when the command changes
                return new Promise((resolve) => {
                    setTimeout(() => {
                        clearInterval(intervalId);
                        resolve('Keylogger activated. Capturing keystrokes...');
                    }, 10000); // Example: stop after 10 seconds
                });
            case 'decrypt_db':
                return 'Database decryption in progress. Sensitive data exposed.'
            case 'launch_virus':
                return 'Virus launched. Target systems compromised.'
            case 'trace_ip':
                return 'IP traced. Location: 127.0.0.1 (localhost)'
            case 'hack_mainframe':
                return 'Mainframe hacked. Full system access granted.'
            case 'delete_logs':
                return 'System logs deleted. No trace of activities remain.'
            default:
                return 'Unknown command. Operation aborted.'
        }
    }

    const commands = [
        { name: 'Keylogger', command: 'keylogger' },
        { name: 'Decrypt Database', command: 'decrypt_db' },
        { name: 'Launch Virus', command: 'launch_virus' },
        { name: 'Trace IP', command: 'trace_ip' },
        { name: 'Hack Mainframe', command: 'hack_mainframe' },
        { name: 'Delete Logs', command: 'delete_logs' },
    ]

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
                        className="w-full bg-green-900/50 hover:bg-green-700/50 text-green-400 border border-green-500 shadow-lg shadow-green-500/50"
                    >
                        {cmd.name}
                    </Button>
                ))}
            </div>

            <h2 className="text-xl font-semibold mb-2">System Output</h2>
            <ScrollArea ref={scrollAreaRef} className="h-64 bg-black/50 p-4 overflow-y-auto border border-green-500">
                {output.map((line, index) => (
                    <p key={index} className="text-green-400">{line}</p>
                ))}
                <p className="text-green-400">{currentLine}</p>
            </ScrollArea>
        </div>
    )
}
