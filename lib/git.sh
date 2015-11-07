#!/bin/sh

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
