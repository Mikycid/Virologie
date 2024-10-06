import { useEffect, useState } from "react";
import {User} from "@/Interfaces/User.ts";

export function DesktopList({ selectedUser, setSelectedUser }: { selectedUser: User | null, setSelectedUser: (user: User) => void }) {
    const [users, setUsers] = useState<Object[]>([]);

    useEffect(() => {
        fetch("http://localhost:8000/api/users")
            .then(async r => {
                const data = await r.json();
                setUsers(data);
            });
    }, []);

    return (
        <div className="mr-4 space-y-4 text-green-500">
            {users.map((user: any) => (
                <div key={user.uuid}
                     className={
                         user === selectedUser ? "border border-green-500 p-3 rounded-lg cursor-pointer bg-green-300 text-black animate-pulse shadow-xl shadow-green-500/50" : "border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black  shadow-md shadow-green-500/50"
                     }
                     onClick={() => setSelectedUser(user)}
                >
                    <p><strong>UUID:</strong> {user.uuid}</p>
                    <p><strong>IP:</strong> {user.ip}</p>
                </div>
            ))}
        </div>
    );
}
