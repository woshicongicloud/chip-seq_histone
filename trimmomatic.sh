#!/bin/bash
# 调用for循环批处理文件
for filename in *_1.fastq.gz
do

# 提取双端公共文件名，并输出检验
base=$(basename $filename _1.fastq.gz)
echo $base

# 运行去接头程序
java -jar ~/miniconda2/bin/trimmomatic-0.38.jar PE -threads 9 \
     ${base}_1.fastq.gz \
     ${base}_2.fastq.gz \
     ${base}_1.qc.fq.gz ${base}_s1_se \
     ${base}_2.qc.fq.gz ${base}_s2_se \
     ILLUMINACLIP:TruSeq2-PE.fa:2:40:15 \
     LEADING:2 TRAILING:2 \
     SLIDINGWINDOW:4:2 \
     MINLEN:25 
done
