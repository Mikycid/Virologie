'use client'

import { useState, useEffect, useRef } from 'react'
import { Button } from "@/components/ui/button"
import { ScrollArea } from "@/components/ui/scroll-area"

export default function AdminPanel() {
    const [output, setOutput] = useState<string[]>([])
    const [currentLine, setCurrentLine] = useState('')
    const [isTyping, setIsTyping] = useState(false)
    const scrollAreaRef = useRef<HTMLDivElement>(null)

    const executeCommand = (command: string) => {
        setOutput(prev => [...prev, `> ${command}`])
        typeOutput(`Executing: ${command}...`)
            .then(() => typeOutput(getCommandOutput(command)))
            .then(() => typeOutput('Operation complete.'))
    }

    const typeOutput = (text: string): Promise<void> => {
        return new Promise((resolve) => {
            setIsTyping(true)
            let index = 0
            const interval = setInterval(() => {
                setCurrentLine(prev => prev + text[index])
                index++
                if (index === text.length) {
                    clearInterval(interval)
                    setOutput(prev => [...prev, text])
                    setCurrentLine('')
                    setIsTyping(false)
                    resolve()
                }
            }, 25)
        })
    }

    const getCommandOutput = (command: string): string => {
        switch (command) {
            case 'bypass_firewall':
                return 'Firewall bypassed. Security protocols disabled.'
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

    useEffect(() => {
        if (scrollAreaRef.current) {
            scrollAreaRef.current.scrollTop = scrollAreaRef.current.scrollHeight
        }
    }, [output, currentLine])

    const commands = [
        { name: 'Bypass Firewall', command: 'bypass_firewall' },
        { name: 'Decrypt Database', command: 'decrypt_db' },
        { name: 'Launch Virus', command: 'launch_virus' },
        { name: 'Trace IP', command: 'trace_ip' },
        { name: 'Hack Mainframe', command: 'hack_mainframe' },
        { name: 'Delete Logs', command: 'delete_logs' },
    ]

    return (
        <div className="min-h-screen bg-black text-green-500 p-4 font-mono">
            <div className="max-w-4xl mx-auto bg-black/50 rounded-lg shadow-lg overflow-hidden border border-green-500">
                <header className="bg-green-900/50 p-4">
                    <h1 className="text-2xl font-bold animate-pulse">Matrix Control Interface</h1>
                </header>

                <div className="p-4">
                    <h2 className="text-xl font-semibold mb-4">System Commands</h2>
                    <div className="grid grid-cols-2 gap-4 mb-4">
                        {commands.map((cmd) => (
                            <Button
                                key={cmd.command}
                                onClick={() => executeCommand(cmd.command)}
                                className="w-full bg-green-900/50 hover:bg-green-700/50 text-green-400 border border-green-500 shadow-lg shadow-green-500/50"
                                disabled={isTyping}
                            >
                                {cmd.name}
                            </Button>
                        ))}
                    </div>

                    <h2 className="text-xl font-semibold mb-2">System Output</h2>
                    <ScrollArea className="h-64 border rounded-md p-4 bg-black text-green-400 font-mono shadow-inner shadow-green-500/50" ref={scrollAreaRef}>
                        {output.map((line, index) => (
                            <div key={index} className="whitespace-pre-wrap">
                                {line}
                            </div>
                        ))}
                        <div className="whitespace-pre-wrap">{currentLine}<span className="animate-blink">_</span></div>
                    </ScrollArea>
                </div>
            </div>
        </div>
    )
}