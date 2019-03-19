#!/usr/bin/python3

import os
import json

number_dict =  { 	 "number_100":0,"number_150":0,"number_200":0
                        ,"number_250":0,"number_300":0,"number_350":0
                        ,"number_400":0,"number_450":0,"number_500":0
                        ,"number_550":0,"number_600":0,"number_650":0
                        ,"number_700":0,"number_750":0,"number_800":0
                        ,"number_850":0,"number_900":0,"number_950":0
                        ,"number_1000+":0 				}

def peak_distribution(file):
	with open (file) as f:
		for line in f:
			if int(line.strip())<=150:
				number_dict["number_100"]+=1
			elif 150< int(line.strip())<=200:
                                number_dict["number_150"]+=1
			elif 200< int(line.strip())<=250:
                                number_dict["number_200"]+=1
			elif 250< int(line.strip())<=300:
                                number_dict["number_250"]+=1
			elif 300< int(line.strip())<=350:
                                number_dict["number_300"]+=1
			elif 350< int(line.strip())<=400:
                                number_dict["number_350"]+=1
			elif 400< int(line.strip())<=450:
                                number_dict["number_400"]+=1
			elif 450< int(line.strip())<=500:
                                number_dict["number_450"]+=1
			elif 500< int(line.strip())<=550:
                                number_dict["number_500"]+=1
			elif 550< int(line.strip())<=600:
                                number_dict["number_550"]+=1
			elif 600< int(line.strip())<=650:
                                number_dict["number_600"]+=1
			elif 650< int(line.strip())<=700:
                                number_dict["number_650"]+=1
			elif 700< int(line.strip())<=750:
                                number_dict["number_700"]+=1
			elif 750< int(line.strip())<=800:
                                number_dict["number_750"]+=1
			elif 800< int(line.strip())<=850:
                                number_dict["number_800"]+=1
			elif 850< int(line.strip())<=900:
                                number_dict["number_850"]+=1
			elif 900< int(line.strip())<=950:
                                number_dict["number_900"]+=1
			elif 950< int(line.strip())<=1000:
                                number_dict["number_950"]+=1
			elif 1000< int(line.strip()):
                                number_dict["number_1000+"]+=1
			else:
	
				print("--------------------------------------Please check your input file------------------------------------------------------")
	jsObj = json.dumps(number_dict)
	dict_file = open("jsonFile.json","w")
	dict_file.write(jsObj)
	dict_file.close()
	print("--------------------------------------------------------------Program done!!!-------------------------------------------------------------------")


if __name__ == "__main__":
	filename = "length_distribution.txt"
	if os.path.exists(filename):
		os.system("rm jsonFile.json")
	else:
		os.system("awk '{print $3-$2}' intersect.bed > length_distribution.txt")
	print("-------------------------------------------------------------Program begining-------------------------------------------------------------------")
	peak_distribution(filename) 


