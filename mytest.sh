#! /bin/bash
# while read line || [ -n "$line" ];do
#     eval $line
#     echo $line
# done < testconfig
# echo $ID
# echo $IP
# echo $Name
# cur_dir=$(pwd)
# echo $cur_dir
str="   Test exec time sec: 2368.811"
declare -f a
b=$(echo $str |awk -F: '{print $2}')
a=$b
# d1=0.003
# d2=0.0008

# # bc parses its input to perform math
# d1d2=$(echo "$d1 + $d2" | bc)
c=$(echo "$b+10.11"|bc)
echo $c
# b=awk -F: '{print $2}' $str
# a=$b;