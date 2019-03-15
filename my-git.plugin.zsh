#!/bin/bash

_mg_get_command_list () {
    awk 'NF > 0 && $1 !~ /^(gtm|commands)/  {print $1}' <(gtm --help 2>&1 >/dev/null | sed '1,3d')
}

_mg () {

    if [ -d .gtm ]; then
        compadd "$(_mg_get_command_list)"
    fi
}

compdef _mg mg

# Alias
alias mgr='git root'

# Duplicating some aliases to use same prefix `g` as the main oh-my-zsh git plugin
alias grt='git root'

