#!/bin/bash

if [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    count=100
    if [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi

    for ((i=1; i<=count; i++)); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
fi

