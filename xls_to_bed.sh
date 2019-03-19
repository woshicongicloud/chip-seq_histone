#!/bin/bash
mkdir bed_file
for i in *.xls;do
	cat $i | awk '$0 ~ "Chr"{print $1,$2,$3}' > ${i%.*}.bed 
	mv ${i%.*}.bed bed_file
	echo "----------- ${i%.*}.bed done HaHa ^-^-----------------" 
done
