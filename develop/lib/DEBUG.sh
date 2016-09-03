#!/bin/echo "warning,this library should be sourced!"
#alert函数检查语句是否正确执行，并报告问题
#DEBUG变量定义是否开启DEBUG
#STEP_THROUGH变量=1则出现错误时暂停，=2则每一部都暂停
alert(){
	local RET_CODE=$?
		if [ -z "$DEBUG" ] || [ "$DEBUG" -eq 0 ];
	then
		return
		fi
		if [ "$RET_CODE" -ne 0 ];then
			echo "Warn: $* failed with a return code of $RET_CODE .">&2
				[ "$DEBUG" -gt 9 ]&& exit "$RET_CODE"
				[ "$STEP_THROUGH" -eq 1 ] && {
					echo "Press [Enter] to continue">&2;read x
				}
	fi
		[ "$STEP_THROUGH" = 2 ] && {
			echo "Press [Enter] to continue">&2;read x
		}
}
