fn_display() {	
	COUNTRY=`cat data/test.csv | cut -d "," -f 1`
	CURRENCY=`cat data/test.csv | cut -d "," -f 2`
	EXCHANGE=`cat data/test.csv | cut -d "," -f 3`
	NAME=`cat data/test.csv | cut -d "," -f 4`
	SYMBOL=`cat data/test.csv | cut -d "," -f 5`
	TYPE=`cat data/test.csv | cut -d "," -f 6`

	echo " "
	echo "COUNTRY: $COUNTRY"
	echo "CURRENCY: $CURRENCY"
	echo "EXCHANGE: $EXCHANGE"
	echo "NAME: $NAME"
	echo "SYMBOL: $SYMBOL"
	echo "TYPE: $TYPE"
	echo " "
}

fn_display
