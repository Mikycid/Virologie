import React, { useState, useEffect, useRef } from 'react';
import { User } from '@/Interfaces/User';
import { executeCommand, initializeModules, getModules } from '@/Modules/commandRegistry';
import { Autocomplete } from './Autocomplete';
import GraphicalActions from './GraphicalActions';

interface TerminalProps {
    selectedUser: User;
}

export const Terminal: React.FC<TerminalProps> = ({selectedUser}) => {
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

    useEffect(() => {
        initializeModules();
        setModules(getModules());
    }, []);

    useEffect(() => {
        if (outputRef.current) {
            outputRef.current.scrollTop = outputRef.current.scrollHeight;
        }
    }, [output]);

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
        // setIsAutocompleteVisible(false);
        // inputRef.current?.focus();
    };

    const handleAutocompleteEscape = () => {
        setIsAutocompleteVisible(false);
    };

    const handleKeyDown = async (event: React.KeyboardEvent<HTMLInputElement>) => {
        // Handle Escape key globally
        if (event.key === 'Escape') {
            if (isAutocompleteVisible) {
                setIsAutocompleteVisible(false);
                return;
            }
        }

        // Only handle history navigation when autocomplete is not visible
        if (!isAutocompleteVisible) {
            if (event.key === 'ArrowUp') {
                event.preventDefault();
                if (history.length === 0) return;
                
                if (historyIndex === -1) {
                    setHistoryIndex(history.length - 1);
                    setInput(history[history.length - 1]);
                }
                else if (historyIndex > 0) {
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
                setHistory(prevHistory => [...prevHistory, trimmedInput]);
                setInput('');
                setHistoryIndex(-1);
                setIsAutocompleteVisible(false);
                
                if (trimmedInput === 'clear') {
                    setOutput([]);
                    setInput('');
                    return;
                }
                
                addOutput(`> ${trimmedInput}`);
                if(trimmedInput.startsWith('/')) {
                    executeCommand(selectedUser, trimmedInput, addOutput);
                } else {
                    try {
                        const response = await fetch('http://localhost:8000/api/shell', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                'command': trimmedInput,
                                'id': selectedUser.uuid
                            })
                        });

                        if (!response.ok) {
                            const errorData = await response.json();
                            throw new Error(`${errorData.detail || 'Unknown error'}`);
                        }

                        const data = await response.json();
                        addOutput(data.output);
                    } catch (error: any) {
                        console.error("Error executing command:", error);
                        addOutput("Error: " + error.message);
                    }
                }
                setInput('');
            }
        }
    };

    const addOutput = (message: string) => {
        setOutput((prevOutput) => [...prevOutput, message]);
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

    return (
        <div className="h-full flex flex-col space-y-2">
            <GraphicalActions selectedUser={selectedUser} addOutput={addOutput} />
            <div className="flex flex-col bg-gray-900 text-white p-4 rounded-lg space-y-2 flex-grow overflow-hidden h-1/2 max-h-1/2">
                <div ref={outputRef} className="output h-full overflow-y-auto flex-grow">
                    {output.map((line, index) => (
                        <div key={index}>{line}</div>
                    ))}
                </div>
                <div className="input flex items-center relative">
                    <span className="mr-2">&gt;</span>
                    <input
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
                        onEscape={handleAutocompleteEscape}
                        position={position}
                        inputRef={inputRef}
                        isVisible={isAutocompleteVisible && input.startsWith('/')}
                    />
                </div>
            </div>
        </div>
    );
};

export default Terminal;