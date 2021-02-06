#!/bin/bash

echo "Welcome to Flip Coin Combination Problem!"

read -p "How many times do you want to flip coins : " limit;
HHH=0
HHT=0
HTH=0
HTT=0
THH=0
TTH=0
THT=0
TTT=0
counter=1

declare -A triplet

for (( i=1; i<=limit; i++))
do
	a=$((RANDOM%2))
	b=$((RANDOM%2))
	c=$((RANDOM%2))

	if [[ $a -eq 0 && $b -eq 0 && $c -eq 0 ]]
	then
		HHH=$(($HHH+1))
		triplet[$((counter++))]="HHH"
		percentage_HHH=`echo - | awk '{printf "%.2f\n",'$HHH/$limit*100'}'`

	elif [[ $a -eq 0 && $b -eq 0 && $c -eq 1 ]]
	then
		HHT=$(($HHT+1))
		triplet[$((counter++))]="HHT"
		percentage_HHT=`echo - | awk '{printf "%.2f\n",'$HHT/$limit*100'}'`

	elif [[ $a -eq 0 && $b -eq 1 && $c -eq 0 ]]
	then
		HTH=$(($HTH+1))
		triplet[$((counter++))]="HTH"
		percentage_HTH=`echo - | awk '{printf "%.2f\n",'$HTH/$limit*100'}'`

	elif [[ $a -eq 0 && $b -eq 1 && $c -eq 1 ]]
	then
		HTT=$(($HTT+1))
		triplet[$((counter++))]="HTT"
		percentage_HTT=`echo - | awk '{printf "%.2f\n",'$HTT/$limit*100'}'`

	elif [[ $a -eq 1 && $b -eq 0 && $c -eq 0 ]]
	then
		THH=$(($THH+1))
		triplet[$((counter++))]="THH"
		percentage_THH=`echo - | awk '{printf "%.2f\n",'$THH/$limit*100'}'`

	elif [[ $a -eq 1 && $b -eq 1 && $c -eq 0 ]]
	then
		TTH=$(($TTH+1))
		triplet[$((counter++))]="TTH"
		percentage_TTH=`echo - | awk '{printf "%.2f\n",'$TTH/$limit*100'}'`

	elif [[ $a -eq 1 && $b -eq 0 && $c -eq 1 ]]
	then
		THT=$(($THT+1))
		triplet[$((counter++))]="THT"
		percentage_THT=`echo - | awk '{printf "%.2f\n",'$THT/$limit*100'}'`

	else
		TTT=$(($TTT+1))
		triplet[$((counter++))]="TTT"
		percentage_TTT=`echo - | awk '{printf "%.2f\n",'$TTT/$limit*100'}'`

	fi
done

echo "The result everytime a coin is flipped is : "
for k in ${!triplet[@]}
do
	echo $k ":" ${triplet[$k]}
done

declare -A triplet_percentage
triplet_percentage[HHH]=$percentage_HHH
triplet_percentage[HHT]=$percentage_HHT
triplet_percentage[HTH]=$percentage_HTH
triplet_percentage[HTT]=$percentage_HTT
triplet_percentage[THH]=$percentage_THH
triplet_percentage[TTH]=$percentage_TTH
triplet_percentage[THT]=$percentage_THT
triplet_percentage[TTT]=$percentage_TTT

echo "Percentage of winning each combination is : "
for k in ${!triplet_percentage[@]}
do
	echo $k ":" ${triplet_percentage[$k]}
done
