#!/bin/bash
echo "---------------------Program begin-------------------------------"

	for i in *.sra;do
		fastq-dump --gzip --split-3 $i -O ${i%.*} 2>${i}_log.txt
	done &

echo "---------------------Program running-----------------------------" 
