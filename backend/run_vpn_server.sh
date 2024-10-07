#!/bin/bash

# Define network name and subnet
NETWORK_NAME="vpn_network"
SUBNET="10.10.0.0/16"

# Check if the network exists
if ! docker network ls | grep -q "$NETWORK_NAME"; then
    echo "Network '$NETWORK_NAME' does not exist. Creating it..."
    docker network create \
      --driver bridge \
      --subnet $SUBNET \
      $NETWORK_NAME
    echo "Network '$NETWORK_NAME' created successfully."
else
    echo "Network '$NETWORK_NAME' already exists."
fi

# Run the OpenVPN container
docker run -d \
  --name openvpn-as \
  --cap-add=NET_ADMIN \
  -p 943:943 \
  -p 443:443 \
  -p 1195:1194/udp \
  -v $(pwd)/openvpn-conf:/etc/openvpn \
  -v $(pwd)/openvpn-data:/openvpn \
  -e DEBUG=1 \
  --restart unless-stopped \
  --network $NETWORK_NAME \
  --ip 10.10.0.5 \
  openvpn/openvpn-as
