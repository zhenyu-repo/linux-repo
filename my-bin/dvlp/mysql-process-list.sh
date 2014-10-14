#!/bin/sh

SCRIPT=`basename $0`
if [ "$#" -ne 3 ]; then
	echo "usage:"
	echo "$SCRIPT <host> <username> <password>"
	exit 0
fi

watch -n 1 mysqladmin -h$1 -u$2 -p$3 processList

