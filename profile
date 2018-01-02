#!/bin/bash

# If you run into trouble with installing gems or bundling, try putting this before command:
# env ARCHFLAGS='-arch x86_64'

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Include modules
load_all_files_in "" before
load_all_files_in ruby
load_all_files_in go
load_all_files_in node
load_all_files_in python
load_all_files_in git
load_all_files_in rf
load_all_files_in emacs
load_all_files_in prompt
load_all_files_in "" after

if ! ssh-add -l &>/dev/null; then
    test -r ~/.ssh-agent && \
            eval "$(<~/.ssh-agent)" >/dev/null

    if ! ssh-add -l &>/dev/null; then
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
        add-ssh-keys
    fi
fi
