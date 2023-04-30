#!/bin/bash

# this script should be run with a single argument.
if [ $# -ne 1 ]; then
    echo "Usage: $0 <PAT>"
    exit 1
fi

# write the PAT to a file
echo $1 > ~/.github_token
