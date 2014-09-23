#!/bin/sh

COUNT=`ps ux | grep  synergyc | grep -v grep | wc -l`

if [ $COUNT -eq 0 ]
then
	echo 'Start synergy daemon...'
	synergyc suzlpwcharry
else
	true
fi

