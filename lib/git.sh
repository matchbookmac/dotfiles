#!/bin/sh

# git shortcuts
alias ga='git add -A .'
alias gac='git commit -a -m '
alias gg='git log --graph --oneline --all --decorate --remotes'
alias gst='git status'
alias gp='git push'
alias gcreate='~/.scripts/git_create_repo.sh'

# show current directory and working branch for git
function parse_git_branch ()
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function gc ()
{
  # echo "$(parse_git_branch)"
  git commit -m "$(parse_git_branch): $1"
}

function gn ()
{
  curl -u matchbookmac https://api.github.com/user/repos -d '{"name":"'$1'"}'
  git remote add origin https://github.com/matchbookmac/$1
}
