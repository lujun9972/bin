#!/bin/echo "warning,this library should be sourced!"
#isalive判断远程系统是否运行，通过ping实现
isalive(){
	NODE=$1
	PING=/bin/ping
	$PING -c 3 $NODE >/dev/null 2>&1
	if [ $? -eq 0 ]
	then
		return 1
	else
		return 0
	fi
}

