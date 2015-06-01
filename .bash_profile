##### ALIASES

# reload bash_profile
alias sb='source ~/.bash_profile'
# edit bash_profile
alias eb='atom ~/.bash_profile'

# shows hidden files in finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# hides hidden files in finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# logs in via ssh to amazon aws instance
alias ec2log='ssh -i ~/.ssh/authorized_keys/matchbook.pem ec2-user@ec2-54-68-80-150.us-west-2.compute.amazonaws.com'

# starts ssh agent and adds key, for use before working with git remote repository
alias startssh='ssh-agent -s | ssh-add ~/.ssh/authorized_keys/matchbook.pem | ssh-add ~/.ssh/id_rsa'

# Used to clone from personal server. Pass project .git file as argument.
alias ec2clone='~/.scripts/ec2clone.sh'

# git shortcuts
alias ga='git add -A .'
alias gc='git commit -m '
alias gac='git commit -a -m '
alias gg='git log --graph --oneline --all --decorate --remotes'
alias gst='git status'

#### Project Scaffolds

# JavaScript & HTML app
alias jsproj='~/.scripts/jsscaffold.sh'
# Ruby and Sinatra App
alias rsproj='~/.scripts/sinatra_ruby.sh'

##### OPTIONS

# color in command line
export CLICOLOR=1

# default editor for will be atom
export EDITOR=atom

# show current directory and working branch for git
function parse_git_branch {

        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'

}

function proml {

# OPTIONAL - if you want to use any of these other colors:

  local        BLACK="\[\033[0;30m\]"

  local    DARK_GREY="\[\033[1;30m\]"

  local          RED="\[\033[0;31m\]"

  local    LIGHT_RED="\[\033[1;31m\]"

  local        GREEN="\[\033[0;32m\]"

  local  LIGHT_GREEN="\[\033[1;32m\]"

  local       YELLOW="\[\033[0;33m\]"

  local LIGHT_YELLOW="\[\033[1;33m\]"

  local         BLUE="\[\033[0;34m\]"

  local   LIGHT_BLUE="\[\033[1;34m\]"

  local       VIOLET="\[\033[0;35m\]"

  local LIGHT_VIOLET="\[\033[1;35m\]"

  local         TEAL="\[\033[0;36m\]"

  local   LIGHT_TEAL="\[\033[1;36m\]"

  local   LIGHT_GREY="\[\033[0;37m\]"

  local        WHITE="\[\033[1;37m\]"

# END OPTIONAL

  local     DEFAULT="\[\033[0m\]"

##### CUSTOM PROMT AT PS1 and PS2

PS1="$DARK_GREY\u$LIGHT_GREY:$VIOLET\W$LIGHT_VIOLET\$(parse_git_branch)$DEFAULT $DARK_GREY|$VIOLET\j$DARK_GREY| <>$DEFAULT "

# PS1="
#  (\___/)
#  (='.'=)
#  (\")__(\")  "

# PS1="
#         _______()()
#        /        @@
#   ~~~~~\\_\;m__m._>o "

PS2="$DARK_GREY    continue$LIGHT_GREY:$VIOLET\W$LIGHT_VIOLET\$(parse_git_branch)$DEFAULT $DARK_GREY|$VIOLET\j$DARK_GREY| <>$DEFAULT "
}

proml


##### CONSTANTS

# amazon ec2 user and url
EC2USER="ec2-user@ec2-54-68-80-150.us-west-2.compute.amazonaws.com"

##### POSTGRES SETTINGS

# Where to find the database cluster
export PGDATA=/usr/local/var/postgres

# Helps some to find Postgres more easily
export PGHOST=/tmp

##
# Your previous /Users/ianmacdonald/.bash_profile file was backed up as /Users/ianmacdonald/.bash_profile.macports-saved_2015-03-01_at_20:17:15
##

# MacPorts Installer addition on 2015-03-01_at_20:17:15: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
