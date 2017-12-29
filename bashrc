#!/bin/bash

# RVM likes this in the root :(
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# FZF fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Find current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOT_DIR
# DOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
DOT_DIR="$( dirname "$SOURCE" )"

# BASE="$DOT_DIR/bash"
BASE="$HOME/.bash"

load_all_files_in() {
    module=${1:-""}
    hook=${2:-""}

    shopt -s nullglob
    for file in $BASE/$hook/$module/*{env,aliases,functions,config}; do
        . "$file"
    done
}

# Include modules
load_all_files_in
load_all_files_in tmux
