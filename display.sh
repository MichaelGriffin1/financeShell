#!/bin/sh

# This file should be easily configurable.

# The ptfn_display function will become the main display function.
# The ptfn_display function is currently broken, and cannot display data correctly.

# Config
FILE="./data/stocks.csv"
DISP_LIM=25

POS_C0="\033[0;0H"
POS_C1="\033[0;20H"
POS_C2="\033[0;40H"
POS_C3="\033[0;60H"
POS_C4="\033[0;80H"
POS_C5="\033[0;100H"



# Add a number, then a capital B to move the cursor down # of steps
ESC="\033["

ptfn_display() {
	LN=2
	INT_DISP_LIM=$(($DISP_LIM+1))

	# Debug
	echo $INT_DISP_LIM
	read NULL

	clear

	printf "${POS_C0}COUNTRY"
	printf "${POS_C1}CURRENCY"
	printf "${POS_C2}EXCHANGE"
	printf "${POS_C3}NAME"
	printf "${POS_C4}SYMBOL"
	printf "${POS_C5}TYPE"

	while [ $LN -le $INT_DISP_LIM ]
	do
		DATA_COUNTRY=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 1`
		DATA_CURRENCY=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 2`
		DATA_EXCHANGE=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 3`
		DATA_NAME=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 4`
		DATA_SYMBOL=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 5`
		DATA_TYPE=`awk -v NR="$LN" '{print}' $@ | cut -d "," -f 6`
		printf "${POS_C0}${ESC}${LN}B${DATA_COUNTRY}"
		printf "${POS_C1}${ESC}${LN}B${DATA_CURRENCY}"
		printf "${POS_C2}${ESC}${LN}B${DATA_EXCHANGE}"
		printf "${POS_C3}${ESC}${LN}B${DATA_NAME}"
		printf "${POS_C4}${ESC}${LN}B${DATA_SYMBOL}"
		printf "${POS_C5}${ESC}${LN}B${DATA_TYPE}"
	done

}




fn_display() {	
	DATA_COUNTRY=`cat data/test.csv | cut -d "," -f 1`
	DATA_CURRENCY=`cat data/test.csv | cut -d "," -f 2`
	DATA_EXCHANGE=`cat data/test.csv | cut -d "," -f 3`
	DATA_NAME=`cat data/test.csv | cut -d "," -f 4`
	DATA_SYMBOL=`cat data/test.csv | cut -d "," -f 5`
	DATA_TYPE=`cat data/test.csv | cut -d "," -f 6`

	clear
	
	printf "${POS_C0}COUNTRY"
	printf "${POS_C1}CURRENCY"
	printf "${POS_C2}EXCHANGE"
	printf "${POS_C3}NAME"
	printf "${POS_C4}SYMBOL"
	printf "${POS_C5}TYPE"

	LN=2

	printf "${POS_C0}${ESC}${LN}B${DATA_COUNTRY}"
	printf "${POS_C1}${ESC}${LN}B${DATA_CURRENCY}"
	printf "${POS_C2}${ESC}${LN}B${DATA_EXCHANGE}"
	printf "${POS_C3}${ESC}${LN}B${DATA_NAME}"
	printf "${POS_C4}${ESC}${LN}B${DATA_SYMBOL}"
	printf "${POS_C5}${ESC}${LN}B${DATA_TYPE}"

	LN=3

	printf "${ESC}0;0H${ESC}${LN}B${DATA_SYMBOL}"
	echo " " 
}

ptfn2_display "${FILE}"
