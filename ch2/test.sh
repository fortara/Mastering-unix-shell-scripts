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

function while_read_line_fd
{
	exec 3<&0
	exec 0<$FILE
	while read line
	do
		echo $line
	done
	exec 0<&3
}

echo "test while_read_line"
time while_read_line|grep time|grep -v "^$"
echo
echo "test while_read_line_bottom"
time while_read_line_bottom|grep time|grep -v "^$"
echo
echo "test while_line_line_fd"
time while_read_line_fd|grep time|grep -v "^$"
echo
