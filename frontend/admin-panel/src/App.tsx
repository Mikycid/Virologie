'use client'

import Interface from "@/components/ui/interface.tsx";
import { DesktopList } from "@/components/ui/desktop-list.tsx";
import { useState } from "react";
import {User} from "@/Interfaces/User.ts";

export default function AdminPanel() {
    const [selectedUser, setSelectedUser] = useState<User | null>(null);

    return (
        <div className="h-screen bg-black p-4">
            <div className="h-full text-green-500 font-mono">
                <div className="h-full grid grid-rows-1 grid-cols-3 gap-1">

                    <div className="col-span-1">
                        <DesktopList selectedUser={selectedUser} setSelectedUser={setSelectedUser}/>
                    </div>
                    <div
                        className="col-span-2 w-full mx-auto bg-black/50 rounded-lg shadow-lg overflow-hidden border border-green-500">
                        <Interface selectedUser={selectedUser}/>
                    </div>
                </div>
            </div>
        </div>
    );
}
