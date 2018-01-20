#if [ -z "$PS1" ]; then 
#   return 
#fi 

#PS1='\h:\W \u\$ '
export PS1="$YELLOW\u$WHITE@$GREEN\h$WHITE: $LIGHT_BLUE\d \t$WHITE: $RED\w \n$WHITE[bash]$RED[\!] $NO_COLOR\$ "

export HISTIGNORE="clear:bg:fg:cd:cd -:exit:date:w:"
# Make bash check its window size after a process completes
shopt -s checkwinsize

