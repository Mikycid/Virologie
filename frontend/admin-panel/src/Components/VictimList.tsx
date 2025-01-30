import { useEffect, useState } from "react";
import { useUserStore } from "@/Stores/UserStore";
import { User } from "@/Interfaces/User";
import { FaUserShield, FaUser, FaNetworkWired } from "react-icons/fa"; // Example icons for roles

export function VictimList({ isTouring }: { isTouring: boolean }) {
  const { selectedUser, setSelectedUser, users, setUsers } = useUserStore();
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (isTouring) {
      setUsers([
        {
          uuid: "sample-uuid",
          username: "sampleuser",
          ip: "192.168.1.1",
          machine_name: "Sample-Machine-With-A-Very-Long-Name",
          is_admin: true,
          is_domain_admin: false,
          logged: true,
          port: 0,
          connection_time: [
            { event: "login", timestamp: "2022-03-01T00:00:00Z" },
          ],
          last_name: "",
          first_name: "",
          domain_name: "",
          latitude: 37.7749,
          longitude: -122.4194,
          city: "San Francisco",
          region: "California",
          country: "US",
        },
      ]);
      setError(null);
      return;
    }

    fetch("http://localhost:8000/api/users")
      .then(async (r) => {
        if (!r.ok) throw new Error("Failed to fetch users");
        const data = await r.json();
        setUsers(
          data.sort(
            (a: User, b: User) => (b.logged ? 1 : 0) - (a.logged ? 1 : 0)
          )
        );
        setError(null);
      })
      .catch(() => {
        setUsers([]);
        setError("Unable to load users. Please try again.");
      });
  }, [isTouring, setUsers]);

  return (
    <div className="space-y-4 text-green-500">
      {!isTouring && error && (
        <p className="text-red-500 font-bold border border-red-500 p-2 rounded-md bg-red-50">
          {error}
        </p>
      )}
      {users.map((user) => (
        <div
          key={user.uuid}
          id={`user-details-${user.uuid}`}
          className={`w-full p-3 rounded-lg cursor-pointer transition-all ${
            user === selectedUser
              ? user.logged
                ? "bg-green-900 border-green-500 shadow-xl shadow-green-500/50 animate-pulse text-green-300"
                : "bg-red-900 border-red-500 shadow-lg shadow-red-500/50 animate-pulse text-red-300"
              : user.logged
              ? "bg-gray-900 border-green-500 shadow-md shadow-green-500/50 hover:bg-green-800 hover:text-green-200"
              : "bg-gray-900 border-red-500 shadow-md shadow-red-500/50 hover:bg-red-800 hover:text-red-200"
          }`}
          onClick={() => setSelectedUser(user)}
        >
          <div className="flex justify-between items-center">
            <p
              className="truncate max-w-xs font-bold"
              title={user.machine_name}
            >
              {user.machine_name}
            </p>
            <span
              className={`px-2 py-1 rounded text-xs font-bold flex items-center gap-1 ${
                user.is_domain_admin
                  ? "text-purple-500 border-purple-500"
                  : user.is_admin
                  ? "text-green-500 border-green-500"
                  : "text-blue-500 border-blue-500"
              } border`}
            >
              {user.is_domain_admin ? (
                <>
                  <FaNetworkWired />
                  DOMAIN ADM
                </>
              ) : user.is_admin ? (
                <>
                  <FaUserShield />
                  ADM
                </>
              ) : (
                <>
                  <FaUser />
                  USR
                </>
              )}
            </span>
          </div>
          <p className="mt-1 text-sm">
            <strong>IP:</strong> {user.ip}
          </p>
          <p className="text-sm">
            <strong>User:</strong> {user.username}
          </p>
        </div>
      ))}
    </div>
  );
}
