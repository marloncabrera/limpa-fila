#!/bin/bash

rm -rf /tmp/fila.tmp
rm -rf /tmp/fila.txt
postqueue -p > /tmp/fila.tmp
sed -i 's/ /\|/g' /tmp/fila.tmp 
awk  'BEGIN{FS=OFS="|"}{print $1;}' /tmp/fila.tmp >> /tmp/fila.txt
sed -i '/^$/d' /tmp/fila.txt
sed -i '/^(/d' /tmp/fila.txt
sed -i -e "1d" /tmp/fila.txt 
sed -i -e "$d" /tmp/fila.txt 
sed -i -e '$d' /tmp/fila.txt
sed -i -e '$s/.$//' /tmp/fila.txt
cat /tmp/fila.txt | while read line; do sudo postsuper -d $line; done
