[[ -f "$(brew --prefix)/etc/grc.zsh" ]] && source "$(brew --prefix)/etc/grc.zsh"
setopt NOMATCH

# AUTO_CD (-J)
# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory. This option is only applicable if the option SHIN_STDIN is set, i.e. if commands are being read from standard input. The option is designed for interactive use; it is recommended that cd be used explicitly in scripts to avoid ambiguity.
setopt AUTO_CD

# AUTO_PUSHD (-N)
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# CDABLE_VARS (-T)
# If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin with a slash, try to expand the expression as if it were preceded by a ‘~’ (see Filename Expansion).
setopt CDABLE_VARS

# CHASE_DOTS
# When changing to a directory containing a path segment ‘..’ which would otherwise be treated as canceling the previous segment in the path (in other words, ‘foo/..’ would be removed from the path, or if ‘..’ is the first part of the path, the last part of the current working directory would be removed), instead resolve the path to the physical directory. This option is overridden by CHASE_LINKS.
# 
# For example, suppose /foo/bar is a link to the directory /alt/rod. Without this option set, ‘cd /foo/bar/..’ changes to /foo; with it set, it changes to /alt. The same applies if the current directory is /foo/bar and ‘cd ..’ is used. Note that all other symbolic links in the path will also be resolved.
# setopt CHASE_DOTS

# CHASE_LINKS (-w)
# Resolve symbolic links to their true values when changing directory. This also has the effect of CHASE_DOTS, i.e. a ‘..’ path segment will be treated as referring to the physical parent, even if the preceding path segment is a symbolic link.
# setopt CHASE_LINKS

# POSIX_CD <K> <S>
# Modifies the behaviour of cd, chdir and pushd commands to make them more compatible with the POSIX standard. The behaviour with the option unset is described in the documentation for the cd builtin in Shell Builtin Commands. If the option is set, the shell does not test for directories beneath the local directory (‘.’) until after all directories in cdpath have been tested.
#
# Also, if the option is set, the conditions under which the shell prints the new directory after changing to it are modified. It is no longer restricted to interactive shells (although printing of the directory stack with pushd is still limited to interactive shells); and any use of a component of CDPATH, including a ‘.’ but excluding an empty component that is otherwise treated as ‘.’, causes the directory to be printed.
# setopt POSIX_CD

# PUSHD_IGNORE_DUPS
# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# PUSHD_MINUS
# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack.
# setopt PUSHD_MINUS

# PUSHD_SILENT (-E)
# Do not print the directory stack after pushd or popd.
# setopt PUSHD_SILENT

# PUSHD_TO_HOME (-D)
# Have pushd with no arguments act like ‘pushd $HOME’.
setopt PUSHD_TO_HOME

# ALWAYS_LAST_PROMPT <D>
# If unset, key functions that list completions try to return to the last prompt if given a numeric argument. If set these functions try to return to the last prompt if given no numeric argument.
setopt ALWAYS_LAST_PROMPT

# ALWAYS_TO_END
# If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word. That is, the cursor is moved to the end of the word if either a single match is inserted or menu completion is performed.

# AUTO_LIST (-9) <D>
# Automatically list choices on an ambiguous completion.

# AUTO_MENU <D>
# Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.

# AUTO_NAME_DIRS
# Any parameter that is set to the absolute name of a directory immediately becomes a name for that directory, that will be used by the ‘%~’ and related prompt sequences, and will be available when completion is performed on a word starting with ‘~’. (Otherwise, the parameter must be used in the form ‘~param’ first.)

# AUTO_PARAM_KEYS <D>
# If a parameter name was completed and a following character (normally a space) automatically inserted, and the next character typed is one of those that have to come directly after the name (like ‘}’, ‘:’, etc.), the automatically added character is deleted, so that the character typed comes immediately after the parameter name. Completion in a brace expansion is affected similarly: the added character is a ‘,’, which will be removed if ‘}’ is typed next.

# AUTO_PARAM_SLASH <D>
# If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.

# AUTO_REMOVE_SLASH <D>
# When the last character resulting from a completion is a slash and the next character typed is a word delimiter, a slash, or a character that ends a command (such as a semicolon or an ampersand), remove the slash.

# BASH_AUTO_LIST
# On an ambiguous completion, automatically list choices when the completion function is called twice in succession. This takes precedence over AUTO_LIST. The setting of LIST_AMBIGUOUS is respected. If AUTO_MENU is set, the menu behaviour will then start with the third press. Note that this will not work with MENU_COMPLETE, since repeated completion calls immediately cycle through the list in that case.
setopt BASH_AUTO_LIST

# COMPLETE_ALIASES
# Prevents aliases on the command line from being internally substituted before completion is attempted. The effect is to make the alias a distinct command for completion purposes
setopt COMPLETE_ALIASES

# COMPLETE_IN_WORD
# If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.

# GLOB_COMPLETE
# When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE. The matches are generated as if a ‘*’ was added to the end of the word, or inserted at the cursor when COMPLETE_IN_WORD is set. This actually uses pattern matching, not globbing, so it works not only for files but for any completion, such as options, user names, etc.
# 
# Note that when the pattern matcher is used, matching control (for example, case-insensitive or anchored matching) cannot be used. This limitation only applies when the current word contains a pattern; simply turning on the GLOB_COMPLETE option does not have this effect.

# HASH_LIST_ALL <D>
# Whenever a command completion or spelling correction is attempted, make sure the entire command path is hashed first. This makes the first completion slower but avoids false reports of spelling errors.

# LIST_AMBIGUOUS <D>
# This option works when AUTO_LIST or BASH_AUTO_LIST is also set. If there is an unambiguous prefix to insert on the command line, that is done without a completion list being displayed; in other words, auto-listing behaviour only takes place when nothing would be inserted. In the case of BASH_AUTO_LIST, this means that the list will be delayed to the third call of the function.

# LIST_BEEP <D>
# Beep on an ambiguous completion. More accurately, this forces the completion widgets to return status 1 on an ambiguous completion, which causes the shell to beep if the option BEEP is also set; this may be modified if completion is called from a user-defined widget.

# LIST_PACKED
# Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.

# LIST_ROWS_FIRST
# Lay out the matches in completion lists sorted horizontally, that is, the second match is to the right of the first one, not under it as usual.

# LIST_TYPES (-X) <D>
# When listing files that are possible completions, show the type of each file with a trailing identifying mark.

# MENU_COMPLETE (-Y)
# On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately. Then when completion is requested again, remove the first match and insert the second match, etc. When there are no more matches, go back to the first one again. reverse-menu-complete may be used to loop through the list in the other direction. This option overrides AUTO_MENU.

# REC_EXACT (-S)
# If the string on the command line exactly matches one of the possible completions, it is accepted, even if there is another completion (i.e. that string with something else added) that also matches.
setopt REC_EXACT


# BASH_AUTO_LIST
# On an ambiguous completion, automatically list choices when the completion function is called twice in succession. This takes precedence over AUTO_LIST. The setting of LIST_AMBIGUOUS is respected. If AUTO_MENU is set, the menu behaviour will then start with the third press. Note that this will not work with MENU_COMPLETE, since repeated completion calls immediately cycle through the list in that case.
setopt BASH_AUTO_LIST

# AUTO_MENU
# Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.
# AUTO_PARAM_KEYS
# If a parameter name was completed and a following character (normally a space) automatically inserted, and the next character typed is one of those that have to come directly after the name (like ‘}’, ‘:’, etc.), the automatically added character is deleted, so that the character typed comes immediately after the parameter name. Completion in a brace expansion is affected similarly: the added character is a ‘,’, which will be removed if ‘}’ is typed next.

# INC_APPEND_HISTORY
# This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
unsetopt INC_APPEND_HISTORY

# INC_APPEND_HISTORY_TIME
# This option is a variant of INC_APPEND_HISTORY in which, where possible, the history entry is written out to the file after the command is finished, so that the time taken by the command is recorded correctly in the history file in EXTENDED_HISTORY format. This means that the history entry will not be available immediately from other instances of the shell that are using the same history file.
# 
# This option is only useful if INC_APPEND_HISTORY and SHARE_HISTORY are turned off. The three options should be considered mutually exclusive.
# setopt INC_APPEND_HISTORY_TIME

# SHARE_HISTORY <K>
# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY, which should be turned off if this option is in effect). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).
# 
# By default, history movement commands visit the imported lines as well as the local lines, but you can toggle this on and off with the set-local-history zle binding. It is also possible to create a zle widget that will make some commands ignore imported commands, and some include them.
# 
# If you find that you want more control over when commands get imported, you may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or INC_APPEND_HISTORY_TIME (see above) on, and then manually import commands whenever you need them using ‘fc -RI’.
unsetopt SHARE_HISTORY

# TODO: what other setopt values are needed here?