if [ $USER == ianmacdonald ]
then
  # amazon ec2 user and url
  ec2user=$(<~/.dotfiles/ec2user)
  # git key path
  gitkeypath=$(<~/.dotfiles/git-key-path)
  # ec2 key path
  ec2keypath=$(<~/.dotfiles/ec2-key-path)

  # Where to find the database cluster
  export PGDATA=/usr/local/var/postgres
fi

##### ALIASES

# If you run into trouble with installing gems or bundling, try putting this before command:
# env ARCHFLAGS='-arch x86_64'

# reload bash_profile
alias sb='source ~/.bash_profile'
# edit bash_profile
alias eb='atom ~/.bash_profile'
# edit cronjobs
alias ec='env EDITOR=nano crontab -e'
# The jobs below are for sending snmp traps
# */2 * * * * /Users/ianmacdonald/.scripts/send_up_snmp_trap.sh
# 1-59/2 * * * * /Users/ianmacdonald/.scripts/send_down_snmp_trap.sh

# shows hidden files in finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# hides hidden files in finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# logs in via ssh to amazon aws instance
alias ec2log="ssh -i $gitkeypath $ec2user"

### RUMBLEFISH STUFFS
# RF logins
ftp='10.20.20.219'
rfserver ()
{
  ssh -i ~/.ssh/rumblefish-vpc.pem 'ubuntu@'$1''
}
# alias ftpserver="ssh -i ~/.ssh/rumblefish-vpc.pem ubuntu@10.20.20.219"

# RF niceties
# Restarts rabbitmq and deletes all queues, exchanges, etc. Make sure you want to do this
alias rmqrestart="rabbitmqctl stop_app && rabbitmqctl reset && rabbitmqctl start_app"

# multnomah ssh logging
alias lbridge="ssh -i ~/.ssh/id_rsa_devops ianm@l-bridge.co.multnomah.or.us"
alias spice="ssh -i ~/.ssh/id_rsa_devops ianm@spice.mcix.us"
alias abridge="ssh a-bridge.internal.mcix.us"

# starts ssh agent and adds key, for use before working with git remote repository
alias startssh="ssh-agent -s | ssh-add $gitkeypath | ssh-add $ec2keypath"

# Used to clone from personal server. Pass project .git file as argument.
alias ec2clone='~/.scripts/ec2clone.sh'

# git shortcuts
alias ga='git add -A .'
alias gc='git commit -m '
alias gac='git commit -a -m '
alias gg='git log --graph --oneline --all --decorate --remotes'
alias gst='git status'
alias gp='git push'
alias gcreate='~/.scripts/git_create_repo.sh'

gn ()
{
  curl -u matchbookmac https://api.github.com/user/repos -d '{"name":"'$1'"}'
  git remote add origin https://github.com/matchbookmac/$1
}

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

PS1="$LIGHT_GREY\u$WHITE:$VIOLET\W$LIGHT_VIOLET\$(parse_git_branch)$DEFAULT $LIGHT_GREY|$VIOLET\j$LIGHT_GREY| <>$DEFAULT "

# PS1="
#  (\___/)
#  (='.'=)
#  (\")__(\")  "

# PS1="
#         _______()()
#        /        @@
#   ~~~~~\\_\;m__m._>o "
numtimes=$((${#USER}-4))
whitespace=""
space=" "
while [ $numtimes -gt 1 ]; do
  whitespace="${whitespace} "
  numtimes=$((numtimes-1))
done

PS2="$LIGHT_GREY$whitespace cont$WHITE:$VIOLET\W$LIGHT_VIOLET\$(parse_git_branch)$DEFAULT $LIGHT_GREY|$VIOLET\j$LIGHT_GREY| <>$DEFAULT "
}

proml


##### POSTGRES SETTINGS

# Helps some to find Postgres more easily
export PGHOST=/tmp

##### MYSQL SETTINGS
export PATH=${PATH}:/usr/local/mysql/bin

##### RabbitMQ Settings
export PATH=$PATH:/usr/local/sbin

##### RVM
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# homebrew tabcomplete
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

##
# Your previous /Users/ianmacdonald/.bash_profile file was backed up as /Users/ianmacdonald/.bash_profile.macports-saved_2015-03-01_at_20:17:15
##

# MacPorts Installer addition on 2015-03-01_at_20:17:15: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
