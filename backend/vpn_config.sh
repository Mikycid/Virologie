#!/bin/bash

docker run -v $(pwd)/openvpn-data/conf:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://172.26.199.159:1194
docker run -v $(pwd)/openvpn-data/conf:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki