#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./convert.sh <number> <unit>"
    exit 1
fi

number=$1
unit=$2

if (( number < 0 )); then
    echo "Number must not be negative"
    exit 3
fi

case "$unit" in
    km|KM)
        result=$((number * 1000))
        new_unit="m"
        ;;
    m|M)
        result=$((number * 100))
        new_unit="cm"
        ;;
    h|H)
        result=$((number * 60))
        new_unit="min"
        ;;
    min|MIN)
        result=$((number * 60))
        new_unit="s"
        ;;
    kg|KG)
        result=$((number * 1000))
        new_unit="g"
        ;;
    *)
        echo "Unknown unit: $unit"
        exit 2
        ;;
esac

echo "$number $unit = $result $new_unit"
