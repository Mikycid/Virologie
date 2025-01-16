export interface User {
    uuid: string;
    ip: string;
    port: number;
    connection_time: { 
        event: string; // "login" or "logout"
        timestamp: string; // ISO 8601 formatted timestamp
    }[];
    is_admin: boolean;
    logged: boolean;
    username: string;
    last_name: string;
    first_name: string;
    machine_name: string;
    is_domain_admin: boolean;
    domain_name: string;
    latitude: number;
    longitude: number;
    city: string;
    region: string;
    country: string;
}
