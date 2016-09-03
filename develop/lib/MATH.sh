#!/bin/echo "warning,this library should be sourced!"
#evenodd 判断奇偶数
evenodd(){
#根据最后一位数字确定奇偶性
	LAST_DIGIT=$(echo $1|sed 's/\(.*\)\(.\)$/\2/')
		case $LAST_DIGIT in
		0|2|4|6|8 )
		#echo 1
		return 1
		;;
	*)
		#echo 0
		return 0
		;;
	esac
}
