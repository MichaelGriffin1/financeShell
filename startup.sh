#!/bin/sh

curl  https://api.twelvedata.com/stocks | jq '.data' | dasel -r json -w csv > data/stocks.csv
