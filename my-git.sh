#!/bin/bash

_hcgtm_get_command_list () {
    awk 'NF > 0 && $1 !~ /^(gtm|commands)/  {print $1}' <(gtm --help 2>&1 >/dev/null | sed '1,3d')
}

_hcgtm () {

    if [ -d .gtm ]; then
        compadd $(_hcgtm_get_command_list)
    fi
}
compdef _hcgtm gtm
compdef _hcgtm hcgtm

#Alias
alias hcgtm-today-summary='gtm report -today -format summary'
alias hcgtm-today='gtm report -today'
alias hcgtm-all='gtm report --all'
alias hcgtm-lastweek='gtm report -last-week'
alias hcgtm-lastweek-summary='gtm report -last-week -format summary'

