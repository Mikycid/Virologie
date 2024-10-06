import {User} from "@/Interfaces/User.ts";
import { useState, useRef } from "react";
import {Logs} from "@/Interfaces/Logs.ts";

export function KeyloggerButtons(
    {
        typeOutput,
        selectedUser,
        clearConsole,
        setOutput
    }:
        {
            typeOutput: (text: string) => Promise<void>,
            selectedUser: User | null,
            clearConsole: () => void,
            setOutput: (value: React.SetStateAction<string[]>) => void
        }
) {
    const [_, setLastLogs] = useState<string>("");

    const intervalRef = useRef<NodeJS.Timeout | null>(null); // To store interval ID

    const startKeylogger = async () => {
        clearConsole();

        if (intervalRef.current) {
            clearInterval(intervalRef.current); // Clear any existing interval before starting a new one
        }
        await refreshKeyloggerData();
        intervalRef.current = setInterval(refreshKeyloggerData, 2000); // 2000 milliseconds = 2 seconds
    };

    const refreshKeyloggerData = async () => {
        if (!selectedUser) return;

        try {
            const response = await fetch("http://localhost:8000/api/modules/keylogger/logs?id=" + selectedUser?.uuid);
            const data: Logs = await response.json();
            const logs = data.logs;

            setLastLogs(prevLogs => {
                if (logs === prevLogs) {
                    return prevLogs; // No changes, don't update
                }

                if (logs.startsWith(prevLogs) && logs !== prevLogs) {
                    setOutput(prev => [...prev, logs]);
                    return logs; // Update with the new logs
                }

                clearConsole(); // Clear console if new logs are different
                typeOutput(logs); // Output new logs
                return logs; // Update state with the new logs
            });
        } catch (error) {
            console.error("Error fetching logs:", error);
        }
    }

    const stopKeylogger = () => {
        if (intervalRef.current) {
            clearInterval(intervalRef.current); // Stop the interval
            intervalRef.current = null; // Reset the reference
            console.log("Keylogger stopped.");
        }
    };

    return (
        <div className="mr-4 space-y-4 text-green-500 h-1/2">
            <button
                onClick={() => startKeylogger()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Start keylogger</p>
            </button>

            <button
                onClick={() => stopKeylogger()}
                className="p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Stop keylogger</p>
            </button>
        </div>
    );
}
