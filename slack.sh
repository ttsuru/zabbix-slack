#!/bin/bash

url='https://hooks.slack.com/services/XXX/XXX/XXX'
username='Zabbix'
icon_url='https://github.com/ttsuru/zabbix-slack/raw/gh-pages/icon.png'

to="$1"
subject="$2"
stat=`echo $subject | cut -d ":" -f 1`

if [ $stat = 'OK' ]; then
    color='good'
elif [ $stat = 'PROBLEM' ]; then
    color='danger'
else
    color=''
fi

message="${subject}"

if [ "$3" != "" ]
then
    fields=", \"fields\": $3"
else
    fields=""
fi


payload="payload={\"channel\": \"${to}\", \"username\": \"${username}\", \"text\": \"${message}\", \"color\": \"${color}\", \"icon_url\": \"${icon_url}\"${fields}}"
curl -m 5 --data-urlencode "${payload}" $url

