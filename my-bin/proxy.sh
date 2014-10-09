#!/bin/sh

IP=`ifconfig eth0 | grep 'inet ' | awk '{print $2}' | sed 's/addr://'`

ssh -N -D $IP:3080 wcharry@pdeexport01 

