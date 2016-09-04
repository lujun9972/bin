#!/bin/bash

org_file=$1

old_ifs=$IFS
IFS="\n"
mail=$(cat -)

function extract_mail_metadata
{
    mail=$1
    tag=$2
    echo $mail |grep "^$tag: "|head -1|sed "s/^$tag: //"
}

function extract_mail_content
{
    mail=$1
    echo $mail |while read line; do
        if echo $line |grep "^$" >/dev/null;then
            cat -
        fi
    done
}

subject=$(extract_mail_metadata "$mail" "Subject")
date=$(extract_mail_metadata "$mail" "Date")
content=$(extract_mail_content "$mail")

echo "* $subject" >>$org_file
echo "[[$date]]" >>$org_file
echo $content >>$org_file

IFS=$old_ifs
