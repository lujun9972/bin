#!/bin/bash
if [ "$1"="" ]
then
	proc=1
else proc=$1
fi

main(){
	PSOUT=$(ps -ef |grep -v "^UID" |sort -n -k2)
	while read line
	do
		line=$(echo "$line" |sed -e s/\>/\\\\\>/g)
		declare -a process=($line)
		pid=${process[1]}
		owner[$pid]=${process[0]}
		ppid[$pid]=${process[2]}
		command[$pid]=$(echo $line|awk '{for(i=8;i<NF;i++){printf "%s ",$i}}')
		children[${ppid[$pid]}]="${children[${ppid[$pid]}]} $pid"
	#	echo "DEBUG_INFO:$pid,${owner[$pid]},${ppid[$pid]},${command[$pid]}"
	#	echo "DEBUG_INFO:$pid,${children[${ppid[$pid]}]}"
	done<<EOF
$PSOUT
EOF
print_tree $proc ""
}
print_tree(){
	id=$1
	echo "$2$id" ${owner[$id]} ${command[$id]}
	if [ "${children[$id]}" = "" ]
	then
		return
	else
		for child in ${children[$id]}
		do
			if [ "$child"="$(echo ${children[${ppid[$child]}]} |awk '{print $NF}')" ]
			then
				echo "$2 \\"
				temp="$2 "
			else
				echo "$2|\\"
				temp="$2| "
			fi
			print_tree $child "$temp"
		done
	fi
}
main

	
