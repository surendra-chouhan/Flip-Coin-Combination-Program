#!/bin/bash

echo "Welcome to Flip Coin Combination Problem!"

read -p "How many times do you want to flip coins : " limit;

#******For Singlet Combination******#
declare -A singlet
c=1
for (( i=1; i<=limit; i++))
do
	a=$((RANDOM%2))


	if [[ $a -eq 0 ]]
	then
		Heads=$(($Heads+1))
		singlet[$((c++))]="H"
	else
		Tails=$(($Tails+1))
		singlet[$((c++))]="T"
	fi
done

percentage_H=`echo - | awk '{printf "%.2f\n",'$Heads/$limit*100'}'`
percentage_T=`echo - | awk '{printf "%.2f\n",'$Tails/$limit*100'}'`

declare -A percentage_singlet
percentage_singlet[H]=$percentage_H
percentage_singlet[T]=$percentage_T

echo "The winning combination in Singlet is : "
for k in ${!percentage_singlet[@]}
do
	echo $k ":" ${percentage_singlet[$k]}
done | sort -nr -k3 | head -1


#*******For Doublet Combination*******#
declare -A doublet
count=1
for (( i=1; i<=limit; i++))
do
	a=$((RANDOM%2))
	b=$((RANDOM%2))

	if [[ $a -eq 0 && $b -eq 0 ]]
	then
		HH=$(($HH+1))
		doublet[$((count++))]="HH"
		percentage_HH=`echo - | awk '{printf "%.2f\n",'$HH/$limit*100'}'`

	elif [[ $a -eq 0 && $b -eq 1 ]]
	then
		HT=$(($HT+1))
		doublet[$((count++))]="HT"
		percentage_HT=`echo - | awk '{printf "%.2f\n",'$HT/$limit*100'}'`

	elif [[ $a -eq 1 && $b -eq 0 ]]
	then
		TH=$(($TH+1))
		doublet[$((count++))]="TH"
		percentage_TH=`echo - | awk '{printf "%.2f\n",'$TH/$limit*100'}'`

	else
		TT=$(($TT+1))
		doublet[$((count++))]="TT"
		percentage_TT=`echo - | awk '{printf "%.2f\n",'$TT/$limit*100'}'`

	fi
done

#for k in ${!doublet[@]}
#do
#	echo $k ":" ${doublet[$k]}
#done

declare -A doublet_percentage
doublet_percentage[HH]=$percentage_HH
doublet_percentage[HT]=$percentage_HT
doublet_percentage[TH]=$percentage_TH
doublet_percentage[TT]=$percenatge_TT

echo "The winning combination in Doublet is : "
for k in ${!doublet_percentage[@]}
do
	echo $k ":" ${doublet_percentage[$k]}
done | sort -nr -k3 | head -1

#*******For Triplet Combination*******#

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

#for k in ${!triplet[@]}
#do
#	echo $k ":" ${triplet[$k]}
#done

declare -A triplet_percentage
triplet_percentage[HHH]=$percentage_HHH
triplet_percentage[HHT]=$percentage_HHT
triplet_percentage[HTH]=$percentage_HTH
triplet_percentage[HTT]=$percentage_HTT
triplet_percentage[THH]=$percentage_THH
triplet_percentage[TTH]=$percentage_TTH
triplet_percentage[THT]=$percentage_THT
triplet_percentage[TTT]=$percentage_TTT

echo "The winning combination in Triplet is : "
for k in ${!triplet_percentage[@]}
do
	echo $k ":" ${triplet_percentage[$k]}
done | sort -nr -k3 | head -1
