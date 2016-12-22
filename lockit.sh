#!/bin/bash

#trap "nice_try" 2 3 15

TTY=$(tty)

nice_try()
{
    echo "请输入密码来解锁!"
    logger -p notice "有人尝试解锁,失败"
}

stty -echo
echo -n "请输入锁屏密码: "
read PASSWORD
echo -n "\n请再输入一次密码"
read CONFIRM_PASSWORD
if [ "$PASSWORD" != "$CONFIRM_PASSWORD" ];then
   echo "密码不匹配!"
   stty echo
   exit 1
fi
clear

while :
do
    read PASSWORD < $TTY         # 强制用户手工输入密码
    if [ "$PASSWORD" = "$CONFIRM_PASSWORD" ];then
       echo "密码正确,解锁"
       break
    fi
    echo "错误的密码!"
    logger -p notice "有人尝试解锁,失败"
done

stty echo
