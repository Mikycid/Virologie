import React, { useState, useEffect } from 'react';
import { User } from '@/Interfaces/User';
import { getModules, executeCommand } from '@/Modules/commandRegistry';

interface GraphicalActionsProps {
  selectedUser: User;
  addOutput: (message: string) => void;
  setModules: (modules: Record<string, any>) => void;
}

export const GraphicalActions: React.FC<GraphicalActionsProps> = ({
  selectedUser,
  addOutput,
  setModules
}) => {
  const [localModules, setLocalModules] = useState<Record<string, any>>({});
  const [selectedModule, setSelectedModule] = useState<string | null>(null);

  useEffect(() => {
    const loadedModules = getModules();
    setLocalModules(loadedModules);
    setModules(loadedModules);
  }, [setModules]);

  const handleModuleSelect = (moduleName: string) => {
    setSelectedModule(moduleName);
    addOutput(`Module selected: ${moduleName}`);
    addOutput('Commands available:');
    Object.keys(localModules[moduleName].commands).forEach((command) => {
      addOutput(`- ${command}`);
    });
  };

  const handleCommandClick = (commandName: string) => {
    if (selectedModule) {
      const commandInput = `/${selectedModule}/${commandName}`;
      addOutput(`> ${commandInput}`);
      executeCommand(selectedUser, commandInput, addOutput);
    }
  };

  return (
    <div className="h-full bg-gray-800 rounded-lg p-2 flex flex-col overflow-hidden">
      <h3 className="text-lg font-semibold text-white mb-2">Select a module</h3>
      <div className="flex-grow overflow-y-auto">
        <div className="modules-grid grid grid-cols-2 gap-2 mb-2">
          {Object.keys(localModules).map((moduleName) => (
            <button
              key={moduleName}
              id={`module-btn-${moduleName}`}
              onClick={() => handleModuleSelect(moduleName)}
              className={`w-full border border-green-500 p-3 rounded-lg cursor-pointer ${
                moduleName === selectedModule
                  ? "bg-green-300 text-black animate-pulse shadow-lg shadow-green-500/50"
                  : "hover:border-green-400 hover:bg-green-300 hover:text-black shadow-md shadow-green-500/50"
              }`}
            >
              {moduleName.charAt(0).toUpperCase() + moduleName.slice(1)}
            </button>
          ))}
        </div>
        {selectedModule && (
          <div className="commands mt-4 space-y-2">
            <h4 className="text-md font-semibold text-white">
              Commands for {selectedModule}
            </h4>
            <div className="commands-list grid grid-cols-2 gap-2">
              {Object.keys(localModules[selectedModule].commands).map((command) => (
                <button
                  key={command}
                  id={`command-btn-${selectedModule}-${command}`}
                  onClick={() => handleCommandClick(command)}
                  className="text-fuchsia-500 w-full border border-fuchsia-500 p-3 rounded-lg cursor-pointer hover:bg-fuchsia-500 hover:text-black shadow-md shadow-fuchsia-500/50"
                >
                  {command.charAt(0).toUpperCase() + command.slice(1)}
                </button>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default GraphicalActions;