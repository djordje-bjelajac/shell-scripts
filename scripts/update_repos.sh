#!/bin/bash
# List of directories
directories=(
  ##
)

# Function to determine the default branch
get_default_branch() {
    git remote show origin | grep 'HEAD branch' | cut -d' ' -f5
}

# Loop through each directory
for dir in "${directories[@]}"
do
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
