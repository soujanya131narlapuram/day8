#!/bin/sh

#Program to generate a birth month of 50 individuals between the
#year 92 & 93. Find all the individuals having birthdays in the same month.
#Store it to finally print.

declare -A std_dict
i=1
echo "The random 50 individuals dates are"
#iterating from 1 to 50, to create 50 individuals date
while [ $i -lt 51 ]
do
	if [ $i -lt 26 ]
	then
		#1993 year random dates for first 25 candidates using RANDOM 
		d1=$(date -d "$((RANDOM%1+1993))-$((RANDOM%12+1))-$((RANDOM%28+1)) $((RANDOM%23+1)):$((RANDOM%59+1)):$((RANDOM%59+1))" '+%Y/%m/%d')
	else
		#1992 year random dates for 26 to 50 candidates using RANDOM
		d1=$(date -d "$((RANDOM%1+1992))-$((RANDOM%12+1))-$((RANDOM%28+1)) $((RANDOM%23+1)):$((RANDOM%59+1)):$((RANDOM%59+1))" '+%Y/%m/%d')
	fi
	echo "candidate$i->$d1"
	#getting the month number from given data d1
	mon=$(date -d "$d1" '+%m')
	#storing the candidate into dictionary using month number as key, if the key is already present it will be appended
	#for explanation https://stackoverflow.com/questions/27832452/associate-multiple-values-for-one-key-in-array-in-bash
	std_dict[$mon]="${std_dict[$mon]}${std_dict[$mon]:+,}'candidate$i"
	#incrementing the iterator variable
	i=$(( $i + 1 ))
done
for key in "${!std_dict[@]}"#displaying all the values from dictionary

do 
	echo "$key->${std_dict[$key]}"
done



+
