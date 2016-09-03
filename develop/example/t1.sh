#!/bin/bash
#即使键盘响应
while :
do
old_stty_settings=$(stty -g) #保存初始设置
	stty -icanon
	Keypress=$(head -c1)
#Keypress=$(dd bs=1 count=1 2>/dev/null)
	echo "you pressed $Keypress"
	stty "$old_stty_settings"
	done
	exit 0
