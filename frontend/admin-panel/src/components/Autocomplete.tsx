import { useEffect, useState, KeyboardEvent } from "react";

interface AutocompleteProps {
    input: string;
    modules: Record<string, any>;
    onSelect: (suggestion: string) => void;
    onEscape: () => void;
    position: { top: number; left: number };
    inputRef: React.RefObject<HTMLInputElement>;
    isVisible: boolean;
}

export const Autocomplete: React.FC<AutocompleteProps> = ({
    input,
    modules,
    onSelect,
    onEscape,
    position,
    inputRef,
    isVisible
}) => {
    const [suggestions, setSuggestions] = useState<string[]>([]);
    const [selectedIndex, setSelectedIndex] = useState(0);
    const [slashOffset, setSlashOffset] = useState(0);

    useEffect(() => {
        setSelectedIndex(0);
    }, [suggestions]);

    useEffect(() => {
        const parts = input.split('/');
        const currentPart = parts[parts.length - 1];
       
        if (parts.length <= 2) {
            const moduleNames = Object.keys(modules);
            setSuggestions(moduleNames.filter(name =>
                name.toLowerCase().startsWith(currentPart.toLowerCase())
            ));
        } else if (parts.length === 3) {
            const moduleName = parts[1];
            const module = modules[moduleName];
            if (module) {
                const commands = Object.keys(module.commands);
                setSuggestions(commands.filter(cmd =>
                    cmd.toLowerCase().startsWith(currentPart.toLowerCase())
                ));
            }
        } else {
            setSuggestions([]);
        }
    }, [input, modules]);

    useEffect(() => {
        if (inputRef.current) {
            const lastSlashIndex = input.lastIndexOf('/');
            if (lastSlashIndex === -1) return;

            const span = document.createElement('span');
            span.style.font = window.getComputedStyle(inputRef.current).font;
            span.style.visibility = 'hidden';
            span.style.position = 'absolute';
            span.textContent = input.substring(0, lastSlashIndex + 1);
            document.body.appendChild(span);
            
            const offset = span.getBoundingClientRect().width;
            document.body.removeChild(span);
            
            setSlashOffset(offset);
        }
    }, [input, inputRef]);

    useEffect(() => {
        const handleKeydown = (e: KeyboardEvent) => {
            if (!isVisible || !suggestions.length) return;

            switch (e.key) {
                case 'ArrowDown':
                    e.preventDefault();
                    setSelectedIndex(prev => 
                        prev < suggestions.length - 1 ? prev + 1 : prev
                    );
                    break;
                case 'ArrowUp':
                    e.preventDefault();
                    setSelectedIndex(prev => 
                        prev > 0 ? prev - 1 : prev
                    );
                    break;
                case 'Tab':
                    e.preventDefault();
                    onSelect(suggestions[selectedIndex]);
                    break;
                case 'Enter':
                    e.preventDefault();
                    onSelect(suggestions[selectedIndex]);
                    break;
                case 'Escape':
                    e.preventDefault();
                    onEscape();
                    break;
            }
        };

        const inputElement = inputRef.current;
        if (inputElement) {
            inputElement.addEventListener('keydown', handleKeydown as any);
            return () => {
                inputElement.removeEventListener('keydown', handleKeydown as any);
            };
        }
    }, [suggestions, selectedIndex, onSelect, onEscape, isVisible]);

    if (!isVisible || !suggestions.length) return null;

    return (
        <div
            className="fixed bg-gray-800 border border-green-700 rounded-lg shadow-lg z-50 max-h-48 overflow-y-auto"
            style={{
                bottom: `calc(100% - ${position.top}px + 16px)`,
                left: position.left + slashOffset + 24,
                minWidth: '150px'
            }}
        >
            {suggestions.map((suggestion, index) => (
                <div
                    key={suggestion}
                    className={`px-4 py-2 cursor-pointer ${
                        index === selectedIndex ? 'bg-green-700' : 'hover:bg-gray-700'
                    }`}
                    onClick={() => onSelect(suggestion)}
                >
                    {suggestion}
                </div>
            ))}
        </div>
    );
};

export default Autocomplete;