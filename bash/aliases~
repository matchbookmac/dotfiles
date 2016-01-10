#!/bin/sh

# Personal machine config
if [ $USER == ianmacdonald ]; then
  # amazon ec2 user and url
  ec2user=$(<~/.dotfiles/ec2user)
  # git key path
  gitkeypath=$(<~/.dotfiles/git-key-path)
  # ec2 key path
  ec2keypath=$(<~/.dotfiles/ec2-key-path)
fi

##### ALIASES

# reload bash_profile
alias sb='source ~/.bash_profile'
# edit bash_profile
alias eb='atom $DOT_DIR'
# edit cronjobs
alias ec='env EDITOR=nano crontab -e'
# The jobs below are for sending snmp traps
# */2 * * * * /Users/ianmacdonald/.scripts/send_up_snmp_trap.sh
# 1-59/2 * * * * /Users/ianmacdonald/.scripts/send_down_snmp_trap.sh

# shows hidden files in finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# hides hidden files in finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# emacs
alias emacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw"

# logs in via ssh to amazon aws instance
alias ec2log="ssh -i $ec2keypath $ec2user"

# starts ssh agent and adds key, for use before working with git remote repository
alias startssh="ssh-agent -s | ssh-add $gitkeypath | ssh-add $ec2keypath"

# Used to clone from personal server. Pass project .git file as argument.
alias ec2clone='~/.scripts/ec2clone.sh'

# server shortcuts
alias server='python -m SimpleHTTPServer 4567'

#### Project Scaffolds

# JavaScript & HTML app
alias jsproj='~/.scripts/jsscaffold.sh'
# Ruby and Sinatra App
alias rsproj='~/.scripts/sinatra_ruby.sh'
# Rails App RUN AFTER `rails new <proj>`
alias railsproj='~/.scripts/railsscaffold.sh'
railsfunction() {
  rails new $1
  cd $1
  railsproj
}
alias rails_new=railsfunction
