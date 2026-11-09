#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./temp.sh <temperature>"
    exit 1
fi

c=$1

f=$((c * 9 / 5 + 32))

echo "${c}C = ${f}F"

if (( c < 0 )); then
    echo "Freezing"
elif (( c <= 4 )); then
    echo "Cold"
elif (( c <= 19 )); then
    echo "Warm"
else
    echo "Hot"
fi
