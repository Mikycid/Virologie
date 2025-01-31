from dataManager.repository.userRepository import UserRepository
import logging

class DNSModule:
    
    def __init__(self, user_repository: UserRepository):
        self.module_name = "dns"
        self.user_repository: UserRepository = user_repository

    async def add_entry(self, uuid, name, ip, domain):
        """
        Adds a DNS entry to the specified domain in Active Directory DNS.

        Args:
            uuid (str): The user identifier.
            name (str): The hostname to add (e.g., "hackstation").
            ip (str): The IP address to associate with the hostname.
            domain (str): The DNS zone (e.g., "virology.fr").
        """
        user = self.user_repository.get_user(uuid)
        if not user.is_domain_admin:
            logging.warning(f"User {uuid} is not a domain admin. Can't add DNS entry.")
            return

        logging.info(f"Domain admin found. Ensuring DNS zone '{domain}' exists and adding record '{name}.{domain}'.")

        # Step 1: Check if the DNS zone exists
        cmd_check_zone = f'''import subprocess; print(subprocess.run(["powershell", "-Command", "[bool](Get-DnsServerZone -Name '{domain}' -ErrorAction SilentlyContinue)"], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW).stdout.strip())'''
        await user.send(cmd_check_zone)
        zone_exists = (await user.receive()).strip()

        logging.info(b"Zone exists: " + zone_exists)

        if zone_exists != b"True":  # If the zone does not exist, create it
            logging.info(f"DNS zone '{domain}' does not exist. Creating it.")
            cmd_create_zone = f'''import subprocess; subprocess.run(["powershell", "-Command", "Add-DnsServerPrimaryZone -Name {domain} -ReplicationScope Domain"], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW)'''
            await user.send(cmd_create_zone)
            response = (await user.receive()).strip()
            if response != b"Success":  # Check for errors
                logging.error(f"Failed to create DNS zone '{domain}': {response}")
                return
            logging.info(f"DNS zone '{domain}' created successfully.")

        # Step 2: Add the A record
        cmd_add_record = f'''import subprocess; subprocess.run(["powershell", "-Command", "Add-DnsServerResourceRecordA -Name {name} -ZoneName {domain} -IPv4Address {ip}"], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW)'''
        await user.send(cmd_add_record)
        response = (await user.receive()).strip()
        if response != b"Success":
            logging.error(f"Failed to add DNS record '{name}.{domain}': {response}")
            return
        logging.info(f"DNS record '{name}.{domain}' added successfully.")

        # Step 3: Verify the record exists
        cmd_verify_record = f'''import subprocess; print(subprocess.run(["powershell", "-Command", "Get-DnsServerResourceRecord -ZoneName {domain} -Name {name}"], capture_output=True, text=True, creationflags=subprocess.CREATE_NO_WINDOW).stdout.strip())'''
        await user.send(cmd_verify_record)
        (await user.receive()).strip()
