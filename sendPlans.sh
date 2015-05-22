#!/bin/bash

# Send wrun to server 

function gWrun
{
	wrun-launch -template $1 -why $2
}

for file in $(ls plans/run/)
do
	gWrun plans/run/$file $1
done

