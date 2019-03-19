#!/bin/bash
echo "---------------------------------------macs2 begin-----------------------------------------"
echo "-----------Please choose default,loose or strict parameter to run macs2--------------------"

read -p "please provide your choice default ,loose or strict : " parameter 
read -p "please provide your cheatment file                  : " Treatment
read -p "please provide your Input file                      : " Input
echo -e "Your input is following below :\n$parameter \n$Treatment \n$Input"
if [ "$parameter" == "loose" ];then
	nohup macs2 callpeak -t $Treatment -c $Input -g 135000000 -B -f BAM -n ${Treatment%.*} -q 0.05 
elif [ "$parameter" == "strict" ];then
	nohup macs2 callpeak -t $Treatment -c $Input -g 135000000 -B -f BAM -n ${Treatment%.*} -q 0.00001
elif [ "$parameter" == "default" ];then
	nohup macs2 callpeak -t $Treatment -c $Input -g 135000000 -B -f BAM -n ${Treatment%.*} -q 0.01
else
	echo "The input you provide is wrong !!! please check your input"
fi & 




