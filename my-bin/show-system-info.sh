#!/bin/sh

# ./show-system-info.sh  |column -t -s=

format_byte(){
while read B dummy; do
	echo "$B" | awk '{ sum=$1 ; hum[1024**3]="GB";hum[1024**2]="MB";hum[1024]="KB"; for (x=1024**3; x>=1024; x/=1024){ if (sum>=x) { printf "%.2f%s\n",sum/x,hum[x];break } }}' 
done
}

CPU_VENDOR=`cat /proc/cpuinfo | grep 'vendor_id' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`
CPU_MODEL=`cat /proc/cpuinfo | grep 'model name' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`
CPU_MHZ=`more /proc/cpuinfo | grep 'cpu MHz' | cut -d: -f2 | awk 'NR==1' | tr -d ' '`
CPU_CORE_NUM=`more /proc/cpuinfo | grep 'core id' | wc -l`

OS_TYPE=`getconf LONG_BIT`
DIST=$(cat /etc/issue|sed -e 's/\\[n,l]//g')
HOSTNAME=`hostname`

MEM=`cat /proc/meminfo | grep MemTotal | awk '{ print $2 }'`
MEM=`echo "$MEM * 1024" | bc | format_byte`
TIME_ZONE=$(date +%Z)

echo "OS Distributor:=$DIST"
echo "OS Type:=$OS_TYPE"
echo "Hostname:=$HOSTNAME"
echo "CPU Vendor:=$CPU_VENDOR"
echo "CPU Model:=$CPU_MODEL"
echo "CPU Speed(single core):=$CPU_MHZ"
echo "CPU Core Number:=$CPU_CORE_NUM"
echo "Memory:=$MEM"
echo "Time Zone:=$TIME_ZONE"

