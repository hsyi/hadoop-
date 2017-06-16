#!bin/bash
jar_path=hadoop-mapreduce-client-jobclient-2.7.3-tests.jar
main_class=TestDFSIO
echo "-----------------------------------------------------------------------"
echo "---------------------------开始Hadoop 集群测试---------------------------"
echo "-----------------------------------------------------------------------"
echo "清空测试目录！"
cur_dir ＝ $(pwd)
while read line || [ -n "$line" ];do
    eval "$line"
done < config
cd $hadoop_test_dir
echo $hadoop_test_dir
echo"开始极小文件测试！"
echo "-----------------------------------------------------------------------"
echo "读写10000个10B的文件"
hadoop jar $jar_path $main_class -write -nrFiles 1000 -size "10B"
hadoop jar $jar_path $main_class -read -nrFiles 1000 -size "10B"
hadoop jar $jar_path $main_class -clean
echo "开始巨文件测试!"
echo "-----------------------------------------------------------------------"
echo "读写5个100G的文件"
hadoop jar $jar_path $main_class -write -nrFiles 5 -size "100GB"
hadoop jar $jar_path $main_class -read -nrFiles 5 -size "100GB"

cd $cur_dir