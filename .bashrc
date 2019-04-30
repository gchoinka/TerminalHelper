# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
export HISTIGNORE="pwd:ls:ls -l:cd"
# When the shell exits, append to the history file instead of overwriting it
#shopt -s histappend

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Whenever a command is executed, write it to a global history
export PROMPT_COMMAND="history -a ~/.bash_history.global"
export HH_CONFIG=hicolor,rawhistory
# On C-r run the swap_history_reverse.sh script, 
function hstrwsl {
  export HISTFILE=~/.bash_history.global
  offset=${READLINE_POINT}
  READLINE_POINT=0
  { READLINE_LINE=$(</dev/tty hstr ${READLINE_LINE:0:offset} 2>&1 1>&$hstrout); } {hstrout}>&1
  READLINE_POINT=${#READLINE_LINE}
  export HISTFILE=~/.bash_history
}
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrwsl"'; fi

## reedit a history substitution line if it failed
shopt -s histreedit
## edit a recalled history line before executing
shopt -s histverify
