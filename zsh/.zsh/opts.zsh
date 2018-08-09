setopt NOMATCH
setopt AUTO_CD

# AUTO_PUSHD (-N)
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# CDABLE_VARS (-T)
# If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin with a slash, try to expand the expression as if it were preceded by a ‘~’ (see Filename Expansion).
setopt CDABLE_VARS

# PUSHD_IGNORE_DUPS
# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# PUSHD_TO_HOME (-D)
# Have pushd with no arguments act like ‘pushd $HOME’.
setopt PUSHD_TO_HOME

# ALWAYS_LAST_PROMPT <D>
# If unset, key functions that list completions try to return to the last prompt if given a numeric argument. If set these functions try to return to the last prompt if given no numeric argument.
setopt ALWAYS_LAST_PROMPT

# BASH_AUTO_LIST
# On an ambiguous completion, automatically list choices when the completion function is called twice in succession. This takes precedence over AUTO_LIST. The setting of LIST_AMBIGUOUS is respected. If AUTO_MENU is set, the menu behaviour will then start with the third press. Note that this will not work with MENU_COMPLETE, since repeated completion calls immediately cycle through the list in that case.
setopt BASH_AUTO_LIST

# COMPLETE_ALIASES
# Prevents aliases on the command line from being internally substituted before completion is attempted. The effect is to make the alias a distinct command for completion purposes
setopt COMPLETE_ALIASES

# REC_EXACT (-S)
# If the string on the command line exactly matches one of the possible completions, it is accepted, even if there is another completion (i.e. that string with something else added) that also matches.
# setopt REC_EXACT


# TODO: what other setopt values are needed here?
# setopt noglob
setopt NO_NOMATCH
# don't update the hitory file as commands are entered so that commands are grouped by session
unsetopt INC_APPEND_HISTORY
# add time stamps to history
setopt EXTENDED_HISTORY
# append to history file when session exits
setopt APPEND_HISTORY
# ignore dupes when searching history
setopt HIST_FIND_NO_DUPS
# setopt HIST_IGNORE_DUPS
# don't save dupes to history file. probably should have HIST_FIND_NO_DUPS or HIST_SAVE_NO_DUPS but not both
setopt HIST_SAVE_NO_DUPS
# don't story history command in history
setopt HIST_NO_STORE