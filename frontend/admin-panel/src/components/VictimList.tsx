import { useEffect, useState } from "react";
import { User } from "@/Interfaces/User.ts";

export function VictimList({
    selectedUser,
    setSelectedUser
}: {
    selectedUser: User | null;
    setSelectedUser: (user: User) => void;
}) {
    const [users, setUsers] = useState<User[]>([]);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        fetch("http://localhost:8000/api/users")
            .then(async (r) => {
                if (!r.ok) throw new Error("Failed to fetch users");
                const data = await r.json();
                const sortedUsers = data.sort((a: User, b: User) => (b.logged ? 1 : 0) - (a.logged ? 1 : 0));
                setUsers(sortedUsers);
                setError(null); // Clear previous errors if successful
            })
            .catch((err) => setError("Unable to load users. Please try again."));
    }, []);

    return (
        <div className="mr-4 space-y-4 text-green-500">
            {error && (
                <p className="text-red-500 font-bold border border-red-500 p-2 rounded-md bg-red-50">
                    {error}
                </p>
            )}
            {users.map((user) => (
                <div
                    key={user.uuid}
                    className={
                        user === selectedUser
                            ? "border border-green-500 p-3 rounded-lg cursor-pointer bg-green-300 text-black animate-pulse shadow-xl shadow-green-500/50"
                            : user.logged
                            ? "border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-md shadow-green-500/50"
                            : "border-dashed border border-red-500 p-3 rounded-md cursor-pointer bg-red-900/50 hover:bg-red-700/50 text-red-400 shadow-lg shadow-red-500/50"
                    }
                    onClick={() => setSelectedUser(user)}
                >
                    <div className="flex justify-between items-center">
                        <p>
                            <strong>UUID:</strong> {user.uuid}
                        </p>
                        <span
                            className={`px-2 py-1 rounded text-xs font-bold ${
                                user.is_admin ? "text-green-500" : "text-blue-500"
                            }`}
                        >
                            {user.is_admin ? "ADM" : "USR"}
                        </span>
                    </div>
                    <p>
                        <strong>IP:</strong> {user.ip}
                    </p>
                    <div className="flex justify-between items-center">
                        <p>
                            <strong>Name:</strong> {user.last_name} {user.first_name}
                        </p>
                        <p>
                            <strong>Username:</strong> {user.username}
                        </p>
                    </div>
                </div>
            ))}
        </div>
    );
}
