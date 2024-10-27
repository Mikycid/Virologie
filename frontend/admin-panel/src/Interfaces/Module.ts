import { Command } from "./Command";

export interface Module {
    commands: Record<string, Command>;
    help: string;
}