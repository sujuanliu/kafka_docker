#!/bin/bash

ip_addr=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1`

if [ ! -n "$ip_addr" ]; then
  echo "is null"
else
  if [ `cat /etc/hosts|grep $1|wc -l` -eq 0 ]; then
    echo "$ip_addr $1" >> /etc/hosts
  else
    sed -i "s/`grep "$1" /etc/hosts|awk '{print $1}'`/$ip_addr/g" /etc/hosts
  fi
fi  
  
