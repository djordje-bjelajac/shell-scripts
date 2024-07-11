#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_repositories_folder>"
    exit 1
fi

# Assign the provided argument to a variable
base_directory=$1

# Function to determine the default branch
get_default_branch() {
    git remote show origin | grep 'HEAD branch' | cut -d' ' -f5
}

# Find directories within the provided base directory and loop through each
for dir in "$base_directory"/*; do
    if [ -d "$dir" ]; then
        echo "Entering directory: $dir"
        cd "$dir" || { echo "Failed to enter directory: $dir"; continue; }

        if [ -d ".git" ]; then
            echo "Checking out the default branch in $dir"
            default_branch=$(get_default_branch)
            git checkout "$default_branch" || { echo "Failed to checkout default branch: $default_branch"; continue; }

            echo "Running git pull in $dir"
            git pull
        else
            echo "Directory $dir is not a git repository."
        fi

        cd - > /dev/null || { echo "Failed to return to previous directory"; exit 1; }
        else
            echo "Directory $dir does not exist."
    fi
done

echo "All done!"
