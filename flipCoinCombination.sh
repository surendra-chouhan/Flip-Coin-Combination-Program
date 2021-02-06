#!/bin/bash

echo "Welcome to Flip Coin Combination Problem!"

read -p "How many times do you want to flip a coin : " limit;
HH=0
HT=0
TH=0
TT=0
counter=1

declare -A doublet

for (( i=1; i<=limit; i++))
do
	a=$((RANDOM%2))
	b=$((RANDOM%2))

	if [[ $a -eq 0 && $b -eq 0 ]]
	then
		HH=$(($HH+1))
		doublet[$((counter++))]="HH"
	elif [[ $a -eq 0 && $b -eq 1 ]]
	then
		HT=$(($HT+1))
		doublet[$((counter++))]="HT"
	elif [[ $a -eq 1 && $b -eq 0 ]]
	then
		TH=$(($TH+1))
		doublet[$((counter++))]="TH"
	else
		TT=$(($TT+1))
		doublet[$((counter++))]="TT"
	fi
done

echo "The result everytime a coin is flipped is : "
for k in ${!doublet[@]}
do
	echo $k ":" ${doublet[$k]}
done

echo "Number of times HH has occured is : " $HH
echo "Number of times HT has occured is : " $HT
echo "Number of times TH has occured is : " $TH
echo "Number of times TT has occured is : " $TT

percentage_HH=`echo - | awk '{printf "%.2f\n",'$HH/$limit*100'}'`
echo "Percentage of getting HH in this doublet combination is : "$percentage_HH"%"

percentage_HT=`echo - | awk '{printf "%.2f\n",'$HT/$limit*100'}'`
echo "Percenatge of getting HT in this doublet combination is : "$percentage_HT"%"

percentage_TH=`echo - | awk '{printf "%.2f\n",'$TH/$limit*100'}'`
echo "Percenatge of getting TH in this doublet combination is : "$percentage_TH"%"

percentage_TT=`echo - | awk '{printf "%.2f\n",'$TT/$limit*100'}'`
echo "Percenatge of getting TT in this doublet combination is : "$percentage_TT"%"
