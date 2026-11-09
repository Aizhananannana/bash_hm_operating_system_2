#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./backup.sh <file>"
    exit 1
fi

file=$1

if [ ! -e "$file" ]; then
    echo "Not found: $file"
    exit 2
elif [ -d "$file" ]; then
    echo "$file is a directory, not a file"
    exit 3
elif [ ! -r "$file" ]; then
    echo "Cannot read $file"
    exit 4
fi

today=$(date +%F)

backup="$file.$today"

if [ -e "$backup" ]; then
    size=$(wc -c < "$backup")
    echo "Backup exists: $backup ($size bytes)"
else
    cp "$file" "$backup"

    size=$(wc -c < "$backup")

    echo "Backup created: $backup ($size bytes)"
fi
