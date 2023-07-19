#!/bin/bash

# Function to count folders and files in a directory
count_folders_and_files() {
    local folder="$1"
    local num_folders=$(find "$folder" -mindepth 1 -type d | wc -l)
    local num_files=$(find "$folder" -type f | wc -l)

    echo -e "Folder \e[33m$folder\e[0m contains:"
    echo "$num_folders folders"
    echo "$num_files files"
}

# Check if a folder is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

# Get the folder path from the first argument
folder="$1"

# Check if the folder exists
if [ ! -d "$folder" ]; then
    echo "Error: Folder '$folder' does not exist."
    exit 1
fi

# Call the function to count folders and files
count_folders_and_files "$folder"
