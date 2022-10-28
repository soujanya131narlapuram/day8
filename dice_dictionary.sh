#!/bin/bash -x
max=0
small=10
dict1={}
die_name=0
#initialing the keys with zero count
for i in {1..6}
do
	dict1[$i]=0
done

#echo ${dict1[1]

while [ 1 -eq 1 ]
do
  die=$(((RANDOM%6)+1))
  echo $die
  count=${dict1[$die]}
  count=$(( $count + 1 ))
  echo $count
  dict1[$die]=$count
  echo ${dict1[$die]}
  if [ ${dict1[$die]} -ge $max ]
  then
	max=${dict1[$die]}
	if [ $max -eq 10 ]
	then
		echo "this is the $die that reached 10"
		break
	fi
   fi
   #n=$(( $n + 1 ))
done
echo $max

smallest=10
for key in ${!dict1[@]}
do 
	if [ ${dict1[key]} -le $smallest ]
	then
		die_name = $key
	fi
done

echo 'small number die is $die_name'