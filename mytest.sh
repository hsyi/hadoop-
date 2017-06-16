#! /bin/bash
while read line || [ -n "$line" ];do
    eval $line
    echo $line
done < testconfig
echo $ID
echo $IP
echo $Name
