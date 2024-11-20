import { User } from "./User";

export interface Command {
    execute: (user: User, args: any, addOutput: (message: string) => void) => void;
    help: string;
}