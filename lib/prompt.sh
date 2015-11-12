#!/bin/sh

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

  PS1="$LIGHT_GREY\u$WHITE:$VIOLET\W$LIGHT_VIOLET$(if [[ ! -z $(echo $(parse_git_branch)) ]]; then echo " [\$(parse_git_branch)] "; fi;)$DEFAULT$LIGHT_GREY|$VIOLET\j$LIGHT_GREY| <>$DEFAULT "

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
