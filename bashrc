#!/bin/bash

# If you run into trouble with installing gems or bundling, try putting this before command:
# env ARCHFLAGS='-arch x86_64'

# Find current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOT_DIR
DOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# BASE="$DOT_DIR/bash"
BASE="$HOME/.bash"

load_all_files_in() {
    if [ -d "$BASE/$1" ]; then
        # shellcheck source=/dev/null
        for file in "$BASE/$1"/*env; do source "$file"; done
        # shellcheck source=/dev/null
        for file in "$BASE/$1"/*functions; do source "$file"; done
        # shellcheck source=/dev/null
        for file in "$BASE/$1"/*aliases; do source "$file"; done
        # shellcheck source=/dev/null
        for file in "$BASE/$1"/*config; do source "$file"; done
    fi
}

# # Include modules
load_all_files_in before
load_all_files_in ""
load_all_files_in after

# RVM likes this in the root :(
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# printf "Hello,
#   _____
#  |_   _|
#    | |  __ _ _ __
#    | | / _  |  _ \\
#   _| || (_| | | | |
#  |_____\__,_|_| |_|\n"
