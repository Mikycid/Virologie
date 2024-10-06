

def main(openvpn_config, config_path):
    import subprocess
    import os
    import re
    import signal
    """
    Main function to handle OpenVPN operations.

    Args:
        openvpn_config (str): OpenVPN configuration content.
        config_path (str): Path where the configuration file will be stored.
    """
    def is_openvpn_running():
        """Check if OpenVPN is running and return its PID, if found."""
        try:
            output = subprocess.check_output(['tasklist'], universal_newlines=True)
            match = re.search(r'openvpn(?:-gui)?\.exe\s+(\d+)', output)
            if match:
                return int(match.group(1))
        except subprocess.CalledProcessError as e:
            print(f"Error checking running processes: {e}")
        return None

    def terminate_openvpn(pid):
        """Terminate the OpenVPN process by PID."""
        try:
            os.kill(pid, signal.SIGTERM)
            print(f"Terminated OpenVPN process with PID: {pid}")
        except Exception as e:
            print(f"Error terminating OpenVPN process: {e}")
    config_dir = os.path.dirname(config_path)
    if not os.path.exists(config_dir):
        os.makedirs(config_dir)

    with open(config_path, 'w') as config_file:
        config_file.write(openvpn_config)

    pid = is_openvpn_running()
    
    if pid is not None:
        terminate_openvpn(pid)

    config_file_name = os.path.basename(config_path)


    try:
        # Start the OpenVPN process in the background
        subprocess.Popen(
            ['C:\\Program Files\\TAP Driver\\openvpn-portable-win64-2.4.9-I601-8\\app\\win10\\bin\\openvpn-gui.exe',
             '--connect', config_file_name, '--config_dir', os.path.abspath(os.path.dirname(config_path)), 
             '--silent_connection', '1'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True
        )

        print("OpenVPN process started in the background.")

    except Exception as e:
        print(f"An error occurred while starting OpenVPN: {e}")

# Example OpenVPN configuration (replace with your actual config)
openvpn_config = """
# Automatically generated OpenVPN client config file
# Generated on Sun Oct  6 15:39:39 2024 by 781f32b4d1d5
# Note: this config file contains inline private keys
#       and therefore should be kept confidential!
#       Certificate serial: 9108875457979699679, certificate common name: infected_AUTOLOGIN
#       Expires 2034-10-04 15:39:38
# Note: this configuration is user-locked to the username below
# OVPN_ACCESS_SERVER_USERNAME=infected
# Define the profile name of this particular configuration file
# OVPN_ACCESS_SERVER_PROFILE=infected@10.10.0.5/AUTOLOGIN
# OVPN_ACCESS_SERVER_AUTOLOGIN=1

# Default Cipher
cipher AES-256-CBC
# OVPN_ACCESS_SERVER_CLI_PREF_ALLOW_WEB_IMPORT=True
# OVPN_ACCESS_SERVER_CLI_PREF_BASIC_CLIENT=False
# OVPN_ACCESS_SERVER_CLI_PREF_ENABLE_CONNECT=False
# OVPN_ACCESS_SERVER_CLI_PREF_ENABLE_XD_PROXY=True
# OVPN_ACCESS_SERVER_WSHOST=10.10.0.5:443
# OVPN_ACCESS_SERVER_WEB_CA_BUNDLE_START
# -----BEGIN CERTIFICATE-----
# MIIByzCCAVGgAwIBAgIEZwKe2jAKBggqhkjOPQQDAjA+MTwwOgYDVQQDDDNPcGVu
# VlBOIFdlYiBDQSAyMDI0LjEwLjA2IDE0OjI5OjQ2IFVUQyA3ODFmMzJiNGQxZDUw
# HhcNMjQxMDA1MTQyOTQ2WhcNMzQxMDA0MTQyOTQ2WjA+MTwwOgYDVQQDDDNPcGVu
# VlBOIFdlYiBDQSAyMDI0LjEwLjA2IDE0OjI5OjQ2IFVUQyA3ODFmMzJiNGQxZDUw
# djAQBgcqhkjOPQIBBgUrgQQAIgNiAARCFYlFrhgpsZAISpZHtiF3oVdrk7u7lvfl
# Iz/89HP6l+nzfbhJSFmWdfNzrKr+fR+u96v87N9AjNWVVotpQvCSyqKEiC3fYVgx
# Zye5pKUokCjhMiLK+hn6ix0fC9L9FLejIDAeMA8GA1UdEwEB/wQFMAMBAf8wCwYD
# VR0PBAQDAgEGMAoGCCqGSM49BAMCA2gAMGUCMBc/BKmOFUVpMA2bcw5Vitb4XIpu
# KwxI9KUvS2nX0xIEGDWq3G9C804af0CUUhH5GAIxAL4lo+GJtR7plVvPQQPexoE8
# dhTTY0ASjSTHSOO3PQ3W5bmdb8U2jBeBvS5SK+WDtg==
# -----END CERTIFICATE-----
# OVPN_ACCESS_SERVER_WEB_CA_BUNDLE_STOP
# OVPN_ACCESS_SERVER_IS_OPENVPN_WEB_CA=1
client
server-poll-timeout 4
nobind
remote localhost 1195 udp
remote localhost 1195 udp
remote localhost 443 tcp
remote localhost 1195 udp
remote localhost 1195 udp
remote localhost 1195 udp
remote localhost 1195 udp
remote localhost 1195 udp
dev tun
dev-type tun
remote-cert-tls server
tls-version-min 1.2
reneg-sec 604800
tun-mtu 1420
verb 3
push-peer-info

<ca>
-----BEGIN CERTIFICATE-----
MIIBeDCB/6ADAgECAgRnAp7SMAoGCCqGSM49BAMCMBUxEzARBgNVBAMMCk9wZW5W
UE4gQ0EwHhcNMjQxMDA1MTQyOTM4WhcNMzQxMDA0MTQyOTM4WjAVMRMwEQYDVQQD
DApPcGVuVlBOIENBMHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEcyF4E3FwU+Ab5iN8
uaWoKS2F2qeBj5zOeE9oH9CCyFa8ZheFB7h9XCSt3Ar7JtI6dbN/2FBbQutG+YdI
oXuqOQqeeD1VuPogwLcRd9b02Rq7q+/gxrnB9XqFbthahYFjoyAwHjAPBgNVHRMB
Af8EBTADAQH/MAsGA1UdDwQEAwIBBjAKBggqhkjOPQQDAgNoADBlAjBEn9rT3Il7
x2R2yPtvm7Ps2SiqrP7hafsuzAHMH8RxIRzLeFGai6BIEUp20FAy3RkCMQC1Xie6
qD9ao4ySDh5tpxrAhgkXkkWs1JJmBIcEiDULuIJIK3tX27hFwmv9UHkOlTE=
-----END CERTIFICATE-----
</ca>
<cert>
-----BEGIN CERTIFICATE-----
MIIBqjCCATCgAwIBAgIIfmk599gnUd8wCgYIKoZIzj0EAwIwFTETMBEGA1UEAwwK
T3BlblZQTiBDQTAeFw0yNDEwMDUxNTM5MzhaFw0zNDEwMDQxNTM5MzhaMB0xGzAZ
BgNVBAMMEmluZmVjdGVkX0FVVE9MT0dJTjB2MBAGByqGSM49AgEGBSuBBAAiA2IA
BCJjr5z4DXH7AXPLQLI5wgKXYqbRIaJm9jhI39ZnB9z+1YxczdXReYDcXNphtGQA
xJJbzOib/I7BFDXi7D4mT4gQ/YbvCW5LnSopRI/u/RfaAmRPvumBalAhpYF6Q9Hu
XKNFMEMwDAYDVR0TAQH/BAIwADALBgNVHQ8EBAMCB4AwEwYDVR0lBAwwCgYIKwYB
BQUHAwIwEQYJYIZIAYb4QgEBBAQDAgeAMAoGCCqGSM49BAMCA2gAMGUCMQDEL2wb
dG5U40yi/RZ3pA6EzAWusfJ41sglmEa02DVuOfX5Y0MtevlUnkGKQMgOobwCMBzj
QfeO9k95PLAwOrziBcSwQDhqlUMIITkvr6CmUfu96nfxl95Z4jLnFuh8EIet4Q==
-----END CERTIFICATE-----
</cert>
<key>
-----BEGIN PRIVATE KEY-----
MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDDTOna4mnnNFEm+ob90
4M/4V029Dh00orWsqdUJCy3tSSd1IPpzLLEw5zCQvxy8Mw6hZANiAAQiY6+c+A1x
+wFzy0CyOcICl2Km0SGiZvY4SN/WZwfc/tWMXM3V0XmA3FzaYbRkAMSSW8zom/yO
wRQ14uw+Jk+IEP2G7wluS50qKUSP7v0X2gJkT77pgWpQIaWBekPR7lw=
-----END PRIVATE KEY-----
</key>
<tls-crypt>
#
# 2048 bit OpenVPN static key (Server Agent)
#
-----BEGIN OpenVPN Static key V1-----
5fa69c27155648bfbb45d0de8fd19420
5dd7a343717e22ebe884fbadee141b30
e86996c5eb7aaa2f47c80d34ac5709be
b3395d49db60e14cecc0829e6b8d192c
1b1c03739d454cb61be187b4199e5b24
eb1b20fb067ead0a7e6470cd8d602b84
3caf72e46dc9ea099a26a0f57d7bbba6
75c36d3c95c51569dc2a112eef0c2099
a830295cd62b2d2335732389a66a83c9
c64ef1d6ea7a3ec9ae9ba28b381ffb5f
d15e25d765c1a9bcd01ebc0dab320140
eb8bf246a0ff51d7c12f1f37846f28a5
c78e6ef9e2f4f67ddfef59ddf0afec16
3460f427f419f25f4eaf233b7bfdef76
a482b8a9d9f7f3aa18e3c47013a5086e
1a3599ac677794559049e1650d2ac504
-----END OpenVPN Static key V1-----
</tls-crypt>
## -----BEGIN RSA SIGNATURE-----
## DIGEST:sha256
## MGUCMQDVqyeSWgYNp3i97aS8JHAaL62wx86rTUir78FhoJQT9r
## Qmq7Lmd1AAqo02HOfYYcsCMHKhjZmfeX7rzpIP+gXbyHH6kiCS
## z00C6fx6yif4cu+By4OQ5dqpH8HH6hS6H6LsJw==
## -----END RSA SIGNATURE-----
## -----BEGIN CERTIFICATE-----
## MIIByzCCAVCgAwIBAgIFAM4ORS8wCgYIKoZIzj0EAwIwPjE8MDoGA1UEAwwzT3Bl
## blZQTiBXZWIgQ0EgMjAyNC4xMC4wNiAxNDoyOTo0NiBVVEMgNzgxZjMyYjRkMWQ1
## MB4XDTI0MTAwNTE0MzAwMFoXDTI1MTAwNjE0MzAwMFowFDESMBAGA1UEAwwJMTAu
## MTAuMC41MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEB543rOQuV2akxAMRpvstdT4Z
## 5qg1BnbS4VULdRaxtoPUbVWQL8hvQ/tBmn0Bnuih1thZhTkA3Yz6saWY+QtAL+Np
## yNSjVDxWj0Ojpu/Uv7D4HyI5Q45qoyNeTECynqfFo0gwRjAMBgNVHRMBAf8EAjAA
## MAsGA1UdDwQEAwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAUBgNVHREEDTALggkx
## MC4xMC4wLjUwCgYIKoZIzj0EAwIDaQAwZgIxAOwfuk94uhyrznEcNlytZXJgyAHa
## WTPubLiz9efY1ZSJ1vFwq4PFptjWpOLqeH3ZpAIxAOYkKovyaFMGPXTnDINljxDv
## Dds++5X2rebjPjHonEHUQyhNo72Sht5+oj72uaasaA==
## -----END CERTIFICATE-----
## -----BEGIN CERTIFICATE-----
## MIIByzCCAVGgAwIBAgIEZwKe2jAKBggqhkjOPQQDAjA+MTwwOgYDVQQDDDNPcGVu
## VlBOIFdlYiBDQSAyMDI0LjEwLjA2IDE0OjI5OjQ2IFVUQyA3ODFmMzJiNGQxZDUw
## HhcNMjQxMDA1MTQyOTQ2WhcNMzQxMDA0MTQyOTQ2WjA+MTwwOgYDVQQDDDNPcGVu
## VlBOIFdlYiBDQSAyMDI0LjEwLjA2IDE0OjI5OjQ2IFVUQyA3ODFmMzJiNGQxZDUw
## djAQBgcqhkjOPQIBBgUrgQQAIgNiAARCFYlFrhgpsZAISpZHtiF3oVdrk7u7lvfl
## Iz/89HP6l+nzfbhJSFmWdfNzrKr+fR+u96v87N9AjNWVVotpQvCSyqKEiC3fYVgx
## Zye5pKUokCjhMiLK+hn6ix0fC9L9FLejIDAeMA8GA1UdEwEB/wQFMAMBAf8wCwYD
## VR0PBAQDAgEGMAoGCCqGSM49BAMCA2gAMGUCMBc/BKmOFUVpMA2bcw5Vitb4XIpu
## KwxI9KUvS2nX0xIEGDWq3G9C804af0CUUhH5GAIxAL4lo+GJtR7plVvPQQPexoE8
## dhTTY0ASjSTHSOO3PQ3W5bmdb8U2jBeBvS5SK+WDtg==
## -----END CERTIFICATE-----
"""
try:
    main(openvpn_config, "C:\Temp\\ovpnConfig\\conf.ovpn")
except Exception as e:
    print(f"An error occurred: {e}")