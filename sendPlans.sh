#!/bin/bash

# Send wrun to server 

function gWrun
{
	echo "Run:"	wrun-launch -template $1 -why $2
	wrun-launch -template $1 -why $2
}

for f in $(ls plans/run/)
do
	if [[ -f "plans/run/${f}" ]]; then
		gWrun plans/run/$f $1
	fi
done

