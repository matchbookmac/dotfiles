#!/bin/sh

##### OPTIONS

# Personal machine config
if [ $USER == ianmacdonald ]; then
  # Where to find the database cluster
  export PGDATA=/usr/local/var/postgres
fi

# color in command line
export CLICOLOR=1

# default editor for will be atom
export EDITOR=atom

##### POSTGRES SETTINGS
# Helps some to find Postgres more easily
export PGHOST=/tmp

##### MYSQL SETTINGS
export PATH=${PATH}:/usr/local/mysql/bin

##### RabbitMQ Settings
export PATH=$PATH:/usr/local/sbin

##### RVM
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

### HEROKU Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# homebrew tabcomplete
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
