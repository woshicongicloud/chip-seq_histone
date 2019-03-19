#!/bin/bash
echo "------------------------Program begins-----------------------------------"
File=file_font.txt
if [ -f "$File" ];then
	rm $File
else
	echo "pragram begins"
fi
echo -n "please enter pair or single :"
read seq_type
if [ "$seq_type" == "pair" ];then
	ls *.gz|while read id;do echo ${id%_*} >> file_font.txt;done
else
	ls *.gz|while read id;do echo ${id%%.*} >> file_font.txt;done
fi 

total_count=$(cat file_font.txt|wc -l)
uniq_count=$(cat file_font.txt|uniq|wc -l)

if [ $total_count -gt $uniq_count ];
	then cat file_font.txt|uniq|while read id ;
		do nohup hisat2 -x ~/ncbi/public/sra/CHIP_data/tair10 -1 ${id}_1.fastq.gz -2 ${id}_2.fastq.gz -S ${id}.sam  ;
		echo "-----------------------${id} hisat done---------------------- "
		nohup samtools sort -o ${id}.bam ${id}.sam
		echo "-----------------------${id} samtools done ------------------ " 
		done
else 
	cat file_font.txt|uniq|while read id ;
                do  nohup hisat2 -x ~/ncbi/public/sra/CHIP_data/tair10 -U ${id}.fastq.gz -S ${id}.sam;
		echo "-----------------------${id} hisat done-----------------------"
		nohup samtools sort -o ${id}.bam ${id}.sam 
		echo "-----------------------${id} samtools done ------------------ "
                done
fi &

#echo "hisat2 done"
#ls *.sam |while read id ;do nohup samtools sort -o ${id%.*}.bam $id & ;done 

#echo "samtools done"
