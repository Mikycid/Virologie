import React, { useState, useEffect } from 'react';
import { User } from '@/Interfaces/User';
import { getModules } from '@/Modules/commandRegistry';

interface GraphicalActionsProps {
  selectedUser: User;
  addOutput: (message: string) => void;
  setModules: (modules: Record<string, any>) => void; // Pass modules to Terminal
}

export const GraphicalActions: React.FC<GraphicalActionsProps> = ({ selectedUser, addOutput, setModules }) => {
  const [modules, setLocalModules] = useState<Record<string, any>>({});

  useEffect(() => {
    const loadedModules = getModules();
    setLocalModules(loadedModules); // Save locally for this component
    setModules(loadedModules); // Pass modules to Terminal
  }, [setModules]);

  const handleModuleSelect = (moduleName: string) => {
    addOutput(`Module selected: ${moduleName}`);
    addOutput('Commands available:');
    Object.keys(modules[moduleName].commands).forEach((command) => {
      addOutput(`- ${command}`);
    });
  };

  return (
    <div className="module-selector space-y-2 h-1/2 max-h-1/2 overflow-y-auto p-2 bg-gray-800 rounded-lg">
      <h3 className="text-lg font-semibold text-white">Select a module</h3>
      <div className="modules-grid grid grid-cols-2 gap-2">
        {Object.keys(modules).map((moduleName) => (
          <button
            key={moduleName}
            id={`module-btn-${moduleName}`} // IDs for Driver.js
            onClick={() => handleModuleSelect(moduleName)}
            className="w-full border border-green-500 p-3 rounded-lg cursor-pointer hover:border-green-400 hover:bg-green-300 hover:text-black shadow-md shadow-green-500/50"
          >
            {moduleName.charAt(0).toUpperCase() + moduleName.slice(1)}
          </button>
        ))}
      </div>
    </div>
  );
};

export default GraphicalActions;
