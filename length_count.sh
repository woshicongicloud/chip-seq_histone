#!/bin/bash
echo "------------------------------------Program begin []~(￣▽￣)~*--------------------------------------------------"
if [ -f total_sum.txt ];then
	rm total_sum.txt
	rm intersect.bed
fi
ls *.bed > Input.txt
if [ -s Input.txt ];then
	for i in *.bed;do
		echo $i >>total_sum.txt
		cat $i |awk '$0 ~ "Chr" {print $3-$2}'|awk '{sum +=$1};END{print sum }'>>total_sum.txt
	done

	bedops --intersect *bed >intersect.bed

	cat intersect.bed |awk '{print $3-$2}'|awk '{sum +=$1};END{print "intersect ",sum }'>>total_sum.txt
else
	echo "---------------------Program is wrong!!!!! Please provide bed file (￣ε(#￣)------------------------------------"
fi
echo "------------------------------------Program done <(￣︶￣)>-----------------------------------------------------"
