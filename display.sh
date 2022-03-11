#!/bin/sh
POS_C0="\033[0;0H"
POS_C1="\033[0;20H"
POS_C2="\033[0;40H"
POS_C3="\033[0;60H"
POS_C4="\033[0;80H"
POS_C5="\033[0;100H"

CURSOR_MVDOWN="\033[1B"

fn_display() {	
	COUNTRY=`cat data/test.csv | cut -d "," -f 1`
	CURRENCY=`cat data/test.csv | cut -d "," -f 2`
	EXCHANGE=`cat data/test.csv | cut -d "," -f 3`
	NAME=`cat data/test.csv | cut -d "," -f 4`
	SYMBOL=`cat data/test.csv | cut -d "," -f 5`
	TYPE=`cat data/test.csv | cut -d "," -f 6`

	tput clear
	
	printf "${POS_C0}COUNTRY"
	printf "${POS_C1}CURRENCY"
	printf "${POS_C2}EXCHANGE"
	printf "${POS_C3}NAME"
	printf "${POS_C4}SYMBOL"
	printf "${POS_C5}TYPE"

	printf "${POS_C0}${CURSOR_MVDOWN}${COUNTRY}"
	printf "${POS_C1}${CURSOR_MVDOWN}${CURRENCY}"
	printf "${POS_C2}${CURSOR_MVDOWN}${EXCHANGE}"
	printf "${POS_C3}${CURSOR_MVDOWN}${NAME}"
	printf "${POS_C4}${CURSOR_MVDOWN}${SYMBOL}"
	printf "${POS_C5}${CURSOR_MVDOWN}${TYPE}"
	echo " " 
}

fn_display
