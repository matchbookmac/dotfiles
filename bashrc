#!/bin/bash

# RVM likes this in the root :(
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

# load after other completions
# FZF fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/imacdonald/code/samba-serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/imacdonald/code/samba-serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/imacdonald/code/samba-serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/imacdonald/code/samba-serverless/node_modules/tabtab/.completions/sls.bash
complete -C /usr/local/bin/terraform terraform
