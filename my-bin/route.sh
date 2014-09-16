#!/bin/sh

# eth1->Internet
# eth0->Intranet

sudo route add default gw 192.168.1.1

sudo route add -net 165.204.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 163.181.49.0 netmask 255.255.255.0 dev eth0
sudo route add -net 10.72.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.239.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.236.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.224.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.35.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.36.0.0 netmask 255.255.0.0 dev eth0
sudo route add -net 10.180.0.0 netmask 255.255.0.0 dev eth0

