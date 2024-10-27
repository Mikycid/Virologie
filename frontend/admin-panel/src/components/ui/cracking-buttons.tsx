import { User } from "@/Interfaces/User.ts";
import { useRef } from "react";

export function CrackingButtons({
    typeOutput,
    selectedUser,
    clearConsole,
    setOutput
}: {
    typeOutput: (text: string) => Promise<void>,
    selectedUser: User | null,
    clearConsole: () => void,
    setOutput: (value: React.SetStateAction<string[]>) => void
}) {

    const fileInputRef = useRef<HTMLInputElement>(null);

    const retrieveNTLM = async () => {
        try {
            await typeOutput("> Retrieving NTLM hash for user: " + selectedUser?.uuid);
            const response = await fetch("http://localhost:8000/api/modules/cracking/retrieve-ntlm?id=" + selectedUser?.uuid);
            const data = await response.json();
            await typeOutput("> NetNTLM_v2 HASH: " + data.ntlm);
            console.log(data.ntlm);
        } catch (error) {
            console.error("Error retrieving NTLM:", error);
        }
    };

    const crackPassword = async () => {
        alert("Select a wordlist txt file to crack the password");
        if (fileInputRef.current) {
            fileInputRef.current.click();
        }
    };

    const handleFileChange = async (event: React.ChangeEvent<HTMLInputElement>) => {
        const wordlistFile = event.target.files?.[0];
        if (!wordlistFile) return;

        try {
            await typeOutput("> Cracking password for user: " + selectedUser?.uuid);

            const formData = new FormData();
            formData.append("id", selectedUser?.uuid || "");
            formData.append("wordlist", wordlistFile);

            const response = await fetch("http://localhost:8000/api/modules/cracking/crack-ntlm?id="+selectedUser?.uuid, {
                method: "POST",
                body: formData
            });

            const data = await response.json();
            await typeOutput("> Password: " + data.password);
            console.log(data.password);
        } catch (error) {
            console.error("Error cracking password:", error);
        }
    };

    const getOldPasswords = async () => {
        try {
            await typeOutput("> Getting old passwords for user: " + selectedUser?.uuid);
            const response = await fetch("http://localhost:8000/api/modules/cracking/old-passwords?id=" + selectedUser?.uuid);
            const data = await response.json();

            await typeOutput("> Old passwords: ");
            data.forEach(async ({ cleartext_password, NetNTLM_v2 }: any) => {
                console.log(cleartext_password, NetNTLM_v2);
                await typeOutput(`> Password: ${cleartext_password}, NetNTLMv2: ${NetNTLM_v2}`);
            });

            console.log(data.oldPasswords);
        } catch (error) {
            console.error("Error getting old passwords:", error);
        }
    };

    return (
        <div className="mr-4 space-y-4 text-green-500 h-1/2">
            <button
                onClick={retrieveNTLM}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Retrieve NTLM</p>
            </button>

            <button
                onClick={crackPassword}
                className="mr-4 border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Crack password</p>
            </button>

            <button
                onClick={getOldPasswords}
                className="border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-lg shadow-green-500/50">
                <p>Get old passwords</p>
            </button>
            <input
                type="file"
                id="wordlist_input"
                title="Select a wordlist"
                accept=".txt"
                style={{ display: 'none' }}
                ref={fileInputRef}
                onChange={handleFileChange}
            />
        </div>
    );
}
