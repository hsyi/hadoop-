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
# declare -f a
b=$(echo $str |awk -F: '{print $2}')
echo $b
# a=$b
# # d1=0.003
# # d2=0.0008

# # # bc parses its input to perform math
# # d1d2=$(echo "$d1 + $d2" | bc)
# c=$(echo "$b+10.11"|bc)
# echo $c
#b=awk -F: '{print $2}' $str
#a=$b;
echo $b
while read line || [ -n "$line" ];do
    eval "$line"
done < config
cd $hadoop_test_dir
linenum=0
avtimesec=0.0
num_testdfsio=0
while read line || [ -n "$line" ];do
    if [ $(($linenum % 9 )) -eq 7 ];then
        tmp=$(echo $line |awk -F: '{print $2}')
	echo $tmp
       	avtimesec=$(echo "$avtimesec + $tmp" |bc)
        let num_testdfsio=num_testdfsio+1
    fi
    let linenum=linenum+1
done < TestDFSIO_results.log
avtimesec=$(echo "$avtimesec / $num_testdfsio" |bc)
echo "平均执行时间：$avtimesec"
