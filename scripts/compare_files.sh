#!/bin/bash

# Define a function to compare files in the two directories
compare_files() {
  local dir1=$1
  local dir2=$2

  # Loop through all files in directory1
  for file in "$dir1"/*; do
    # Get the filename without path
    filename=$(basename -- $file)

    # Check if the file exists in directory2
    if [ -f "${dir2}/${filename}" ]; then
      # If it exists, check if the contents are different
      if [ "$(cmp -s "$file" "${dir2}/${filename}") " = 1 ]; then
        echo "File ${filename} is different between directories"
        break
      fi
    else
      # If it doesn't exist, print a message
      echo "File ${filename} not found in directory2"
    fi
  done
}

# Check if the script was called with exactly two arguments (directories)
if [ $# -ne 2 ]; then
  echo "Usage: $0 ${dir1} ${dir2}"
  exit 1
fi

# Call the function with the provided directories
compare_files "$@"