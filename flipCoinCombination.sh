#!/bin/bash

echo "Welcome to Flip Coin Combination Problem!"

read -p "How many times do you want to flip a coin : " limit;
Heads=0
Tails=0
counter=1

declare -A singlet

for (( i=1; i<=limit; i++))
do
	a=$((RANDOM%2))


	if [[ $a -eq 0 ]]
	then
		Heads=$(($Heads+1))
		singlet[$((counter++))]="H"
	else
		Tails=$(($Tails+1))
		singlet[$((counter++))]="T"
	fi
done

echo "The result everytime a coin is flipped is : "
for k in ${!singlet[@]}
do
	echo $k ":" ${singlet[$k]}
done

echo "Number of times Heads won is : " $Heads
echo "Number of times Tails won is : " $Tails

percentage_H=`echo - | awk '{printf "%.2f\n",'$Heads/$limit*100'}'`
echo "Percentage of getting Heads in this singlet combination is : "$percentage_H"%"

percentage_T=`echo - | awk '{printf "%.2f\n",'$Tails/$limit*100'}'`
echo "Percenatge of getting Tails in this singlet combination is : "$percentage_T"%"
