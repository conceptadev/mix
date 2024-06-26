#!/bin/bash

# Check if a path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

# Set the path to the provided argument
path="$1"

# Find all CHANGELOG.md files in the specified path
changelogs=$(find "$path" -name "CHANGELOG.md")

# Check if any CHANGELOG.md files were found
if [ -z "$changelogs" ]; then
    echo "No CHANGELOG.md files found in $path"
    exit 0
fi

# Loop through each CHANGELOG.md file
for changelog in $changelogs; do
    # Check if the CHANGELOG.md file is empty
    if [ ! -s "$changelog" ]; then
        echo "Error: $changelog is empty"
        exit 1
    fi

    # Check if the CHANGELOG.md file has the latest version
    changelog_version=$(grep -E '^##\s+\d+\.\d+\.\d+' "$changelog" | head -n 1 | sed 's/^##\s+//')
    if [ -z "$changelog_version" ]; then
        echo "Error: Could not find the latest version in $changelog"
        exit 1
    fi

    changelog_version=${changelog_version##*## }
    # Get the directory containing the CHANGELOG.md file
    dir=$(dirname "$changelog")
    # Check if the latest version is the same as the package version
    package_version=$(grep -E '^version:\s+\d+\.\d+\.\d+' "$dir/pubspec.yaml" | sed 's/^version:\s+//')
    package_version=${package_version##*version: }
    if [ "$changelog_version" != "$package_version" ]; then
        echo "Error: Latest version in $changelog ($changelog_version) does not match package version in $dir/pubspec.yaml ($package_version)"
        exit 1
    fi

    echo ${dir##*/}: changelog: $changelog_version = pubspec: $package_version
done

echo "All CHANGELOG.md files are up to date"
exit 0
