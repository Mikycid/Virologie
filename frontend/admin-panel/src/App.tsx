'use client'

import Interface from "@/components/ui/interface.tsx";
import {DesktopList} from "@/components/ui/desktop-list.tsx";
import {useState} from "react";
import {User} from "@/Interfaces/User.ts";

export default function AdminPanel() {
    const [selectedUser, setSelectedUser] = useState<User | null>(null);
    const [selectedModule, setSelectedModule] = useState<string>("");

    return (
        <div className="h-screen bg-black p-4">
            <div className="h-full text-green-500 font-mono">
                <div className="h-full grid grid-rows-4 grid-cols-3 gap-1">
                    <DesktopList selectedUser={selectedUser} setSelectedUser={setSelectedUser} setSelectedModule={setSelectedModule}/>
                    <div className="col-span-2 row-span-4 w-full mx-auto bg-black/50 rounded-lg shadow-lg overflow-hidden border border-green-500">
                        <Interface selectedUser={selectedUser} selectedModule={selectedModule} setSelectedModule={setSelectedModule}/>
                    </div>
                </div>
            </div>
        </div>
    );
}
