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
bind -x '"\C-r": "~/bin/swap_history_reverse.sh"'

## reedit a history substitution line if it failed
shopt -s histreedit
## edit a recalled history line before executing
shopt -s histverify
