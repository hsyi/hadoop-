#!bin/bash
jar_path=hadoop-mapreduce-client-jobclient-2.7.3-tests.jar
main_class=TestDFSIO
echo "-----------------------------------------------------------------------"
echo "---------------------------开始Hadoop 集群测试---------------------------"
echo "-----------------------------------------------------------------------"
echo "清空测试目录！"
cur_dir＝$(pwd)
while read line || [ -n "$line" ];do
    eval "$line"
done < config
cd $hadoop_test_dir
# echo $hadoop_test_dir
rm TestDFSIO_results.log
echo "开始极小文件测试！"
echo "-----------------------------------------------------------------------"
echo "读写100个10B的文件"
hadoop jar $jar_path $main_class -write -nrFiles 100 -size "10B"
hadoop jar $jar_path $main_class -read -nrFiles 100 -size "10B"
hadoop jar $jar_path $main_class -clean
echo "开始巨文件测试!"
echo "-----------------------------------------------------------------------"
echo "读写5个1G的文件"
hadoop jar $jar_path $main_class -write -nrFiles 5 -size "1GB"
hadoop jar $jar_path $main_class -read -nrFiles 5 -size "1GB"
linenum=0
avtimesec=0
num_testdfsio=0
while read line || [ -n "$line" ];do
    if [ $(($linenum % 9 )) -eq 8 ];then
        $tmp=$(echo $line | awk -F, '{print $2}')
        let avtimesec=avtimesec+tmp
        let num_testdfsio=num_testdfsio+1
    fi
    let linenum=linenum+1
done < TestDFSIO_results.log
let avtimesec=avtimesec/num_testdfsio
echo "平均执行时间：$avtimesec"
cd $cur_dir