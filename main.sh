#!/bin/sh

# Display function
fn_display() {
	echo "Symbol:"
	read BYSYMBOL
	echo "Country:"
	read BYCOUNTRY


	cat data/stocks.csv | grep -e "$BYSYMBOL" -e "$BYCOUNTRY"| cut -d "," -f 1
}

curl  https://api.twelvedata.com/stocks | jq '.data' | dasel -r json -w csv > data/stocks.csv
cat data/stocks.csv | grep 'MSFT' | grep 'United States'

echo "Executing display command..."
fn_display
