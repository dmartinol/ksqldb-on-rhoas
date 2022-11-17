#!/bin/bash

function usage() {
  echo "Use as \"$(basename $0) -o <no of orders: 1..50>\""
  exit 1
}

function newOrder() {
  RAN=$(($RANDOM % 3 + 1))
  CUSTOMERID="$(printf "C%s" $(($RANDOM % 3 + 1)))"
  ITEMID=$(printf "A%d" $(($RANDOM % 3 + 1)))
  PRICE=$(($RANDOM % 1500 / 10))

  echo "Creating new order for customer $CUSTOMERID, item $ITEMID and price $PRICE"
  echo "{
  \"CUSTOMERID\" : \"$CUSTOMERID\",
  \"ITEMID\" : \"$ITEMID\",
  \"PRICE\" : $PRICE
  }" > data.json

  rhoas kafka topic produce --name orders --file data.json
}

while getopts 'o:' flag
do
  case "${flag}" in
    o)
      orders=${OPTARG}
      ;;
  esac
done
if (( orders > 50 || orders < 1 )); then
  usage
fi
echo "Creating $orders new orders";

source .env

for o in $(eval echo "{1..$orders}")
do
  newOrder
done



