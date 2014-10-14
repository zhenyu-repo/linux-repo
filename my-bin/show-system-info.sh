#!/bin/sh

# ./show-system-info.sh  |column -t -s=

CPU_VENDOR=`cat /proc/cpuinfo | grep 'vendor_id' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`
CPU_MODEL=`cat /proc/cpuinfo | grep 'model name' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`
CPU_MHZ=`more /proc/cpuinfo | grep 'cpu MHz' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`

OS_TYPE=`getconf LONG_BIT`
DIST=$(cat /etc/issue|sed -e 's/\\[n,l]//g')
HOSTNAME=`hostname`

MEM=`cat /proc/meminfo | grep MemTotal | awk '{ print $2 }'`
TIME_ZONE=$(date +%Z)

echo "OS Distributor:=$DIST"
echo "OS Type:=$OS_TYPE"
echo "Hostname:=$HOSTNAME"
echo "CPU Vendor:=$CPU_VENDOR"
echo "CPU Model:=$CPU_MODEL"
echo "CPU Speed:=$CPU_MHZ"
echo "Memory:=$MEM"
echo "Time Zone:=$TIME_ZONE"

