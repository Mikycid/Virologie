#!/bin/bash

docker run -v $(pwd)/openvpn-data/conf:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full shared_client nopass

docker run -v $(pwd)/openvpn-data/conf:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient shared_client > shared_client.ovpn
