#!/bin/bash
#set -x #uncomment to debug 
#set -n #uncomment to check grammer
FILE="./example"
function while_read_line
{
	cat $FILE|while read line
	do
		echo $line
	done
}

function while_read_line_bottom
{
	while read line
	do
		echo $line
	done<$FILE
}
time while_read_line
time while_read_line_bottom
