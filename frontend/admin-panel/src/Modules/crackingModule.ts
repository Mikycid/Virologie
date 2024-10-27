// vpnModule.ts
import { Command } from '@/Interfaces/Command';
import { Module } from '@/Interfaces/Module';


const retrieveNTLM: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("> Retrieving NTLM hash for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/cracking/retrieve-ntlm?id=" + user.uuid);
            const data = await response.json();
            addOutput("> NetNTLM_v2 HASH: " + data.ntlm);
        } catch (error) {
            console.error("Error retrieving NTLM:", error);
        }
    },
    help: "Retrieve NTLM hash for a user. Usage: /cracking/retrieve-ntlm"
};

const crackPassword: Command = {
    execute: async (user, args, addOutput) => {
        const fileInputRef = document.createElement("input");
        fileInputRef.type = "file";
        fileInputRef.accept = ".txt";
        fileInputRef.click();
        fileInputRef.onchange = async (event) => {
            const wordlistFile = (event.target as HTMLInputElement).files?.[0];
            if (!wordlistFile) return;

            try {
                addOutput("> Cracking password for user: " + user.uuid);

                const formData = new FormData();
                formData.append("id", user.uuid);
                formData.append("wordlist", wordlistFile);

                const response = await fetch("http://localhost:8000/api/modules/cracking/crack-ntlm?id="+user.uuid, {
                    method: "POST",
                    body: formData
                });

                if(!response.ok) {
                    const errorData = await response.json();
                    throw new Error(`${errorData.detail || 'Unknown error'}`);
                }

                const data = await response.json();
                addOutput("> Password: " + data.password);
            } catch (error: any) {
                addOutput("Could not crack the password: " + error.message);
                console.error("Error cracking password:", error);
            }
        };
    },
    help: "Crack password for a user. Usage: /cracking/crack-password"
}

const getOldPasswords: Command = {
    execute: async (user, args, addOutput) => {
        try {
            addOutput("> Getting old passwords for user: " + user.uuid);
            const response = await fetch("http://localhost:8000/api/modules/cracking/old-passwords?id=" + user.uuid);
            const data = await response.json();
            if (data.length === 0) {
                addOutput("> No old passwords found.");
                return;
            }
            addOutput("> Old passwords: ");
            data.forEach(({ cleartext_password, NetNTLM_v2 }: any) => {
                addOutput(`> Password: ${cleartext_password}, NetNTLMv2: ${NetNTLM_v2}`);
            });
        } catch (error) {
            console.error("Error getting old passwords:", error);
        }
    },
    help: "Get old passwords for a user. Usage: /cracking/old-passwords"
};


export const crackingModule: Module = {
    commands: {
        retrieveNTLM,
        crackPassword,
        getOldPasswords
    },
    help: 'Module for cracking passwords'
};


