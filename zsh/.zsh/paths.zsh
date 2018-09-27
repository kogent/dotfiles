# # Path for cd to search; used to need to explicitly set "." for the cdmatch
# # function (and retained for backward compatibility).
# cdpath=( . )
# export CDPATH
# # Only unique entries please.
# typeset -U cdpath
# rationalize-path cdpath

# # Path to search for autoloadable functions.
fpath=(/usr/local/share/zsh-completions ${HOME}/.zsh/functions.zsh /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions $fpath)
# fpath=( $HOME/lib/zsh/func "$fpath[@]" )
export FPATH
# # Only unique entries please.                                               

typeset -U fpath
rationalize-path fpath

# Include function path in script path so that we can run them even
# though a subshell may not know about functions.
# PATH should already be exported, but in case not. . .
path=(
  "${HOME}/bin/${MACHTYPE}-${OSTYPE}"
  "${HOME}/.rbenv/shims"
  "${HOME}/bin"
  "${HOME}/.local/bin"
  "${HOME}/.ssh/argv0"
  "${GOPATH}/bin"
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/gnu-tar/libexec/gnubin
  /usr/local/bin
  /usr/local/sbin
  /Users/mcarey/Library/Python/3.7/bin
  /Users/mcarey/Library/Python/2.7/bin
  /sbin
  /bin
  /usr/bin
  /usr/sbin
  /usr/ucb
  /usr/bsd
  /usr/X11/bin
  /usr/bin/X11
  /usr/local/X11/bin
  /usr/local/contrib/lib/kde/bin
  /usr/local/tex/bin
  "$path[@]"
  "$fpath[@]"
)

export PATH
# Only unique entries please.
typeset -U path
# Remove entries that don't exist on this system.  Just for sanity's
# sake more than anything.
rationalize-path path

if [[ ${+MANPATH} -eq 0 ]]
then
  # Only do this if the MANPATH variable isn't already set.
  if whence manpath >/dev/null 2>&1
  then
    # Get the original manpath, then modify it.
    MANPATH="`manpath`"
    manpath=(
      "${HOME}/man"
      "${HOME}/usr/share/man"
      "$manpath[@]"
    )
  else
    # This list is out of date, but it will suffice.
    manpath=(
      "${HOME}/man"
      "${HOME}/usr/share/man"
      /usr/local/opt/coreutils/libexec/gnuman
      /usr/local/lib/node_modules/npm/man
      /usr/local/share/man
      /usr/share/man
      /usr/X11/man
      /opt/X11/share/man
      /Library/Frameworks/Mono.framework/Versions/Current/share/man
      "${HOME}/.rvm/share/man"
      /Applications/Xcode.app/Contents/Developer/usr/share/man
      /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man
    )
    rationalize-path manpath
  fi
  # And, as always, no duplicate entries are needed.
  typeset -U manpath
  export MANPATH
fi

# paths to search for info command
export INFOPATH=/usr/local/share/info:/usr/share/info
