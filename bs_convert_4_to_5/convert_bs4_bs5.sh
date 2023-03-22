#!/bin/bash

# Check for arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: ./convert_bs4_bs5.sh <root folder>"
    exit 1
fi

# Set the paths of the files containing the search and replace expressions
SEARCH_FILE="bs4.txt"
REPLACE_FILE="bs5.txt"

# Loop through each file in the directory
find "$1" -type f | while read file; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        echo "Performing search and replace on file: $file"
        # Loop through each line in the search file
        while read -r search; do
            # Read the corresponding line from the replace file
            read -r replace <&3
            echo "Search expression: $search"
            echo "Replace expression: $replace"
            # Perform the search and replace using sed
            sed -i "s#\b$search\b#$replace#g" "$file"
        done < "$SEARCH_FILE" 3< "$REPLACE_FILE"
    fi
done