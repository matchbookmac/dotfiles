# -*- sh -*-
#!/bin/sh

# If you run into trouble with installing gems or bundling, try putting this before command:
# env ARCHFLAGS='-arch x86_64'

# Find current directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export DOT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Include modules
source $DOT_DIR/bash/env
source $DOT_DIR/bash/config
source $DOT_DIR/bash/aliases

# RVM likes this in the root :(
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

printf "Hello,
  _____
 |_   _|
   | |  __ _ _ __
   | | / _  |  _ \\
  _| || (_| | | | |
 |_____\__,_|_| |_|\n"

source ~/.xsh
