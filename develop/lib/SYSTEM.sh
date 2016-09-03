#!/bin/echo "this library should be sourced "
#timeout在后台执行接受的命令，并设定超时时间，超时后会把命令干掉
timeout(){
	waitfor=$1
	shift
	command=$*
	$command &
	commandpid=$!
	(sleep $waitfor;kill -9 $commandpid >/dev/null 2>&1)&
	watchdogpid=$!
	sleeppid=$(ps --ppid $watchdogpid |awk '{print $1}')
	wait $commandpid
	kill $sleeppid>/dev/null 2>&1
}
#entirecopy完全原样拷贝文件，硬链接拷贝出来也是硬链接
entirecopy() {
	srcDir=$1;
	destDir=$2;
	machine=$3;
#machine=${machine:="localhost"}
	if [[ matchine ]]
		then
			find . -depth |xargs tar cvf - | ssh $machine '((cd $destDir ||mkdir -p $destDir)&&tar xvfp -)'
	else
		tar cvf - $(ls -a $srcDir) |((cd $destDir ||mkdir -p $destDir)&&tar xvfp -)
			fi
}
