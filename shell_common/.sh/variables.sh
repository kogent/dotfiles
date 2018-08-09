# Yes, these are a pain to customize. Fortunately, Geoff Greer made an online
# tool that makes it easy to customize your color scheme and keep them in sync
# across Linux and OS X/*BSD at http://geoff.greer.fm/lscolors/
export CLICOLORS=1
export LSCOLORS="Exgxcxfxbxeghdabaghead"
export LS_COLORS="di=1;34:ln=36:so=32:pi=35:ex=31:bd=34;46:cd=37;43:su=30;41:sg=30;46:tw=37;44:ow=30;43"

# Color escapes for colorizing output
BLACK="\033[0;30m"
DARK_GRAY="\033[1;30m"
BLUE="\033[0;34m"
LIGHT_BLUE="\033[1;34m"
GREEN="\033[0;32m"
LIGHT_GREEN="\033[1;32m"
CYAN="\033[0;36m\]"
LIGHT_CYAN="\033[1;36m"
RED="\[\033[0;31m\]"
LIGHT_RED="\033[1;31m"
PURPLE="\033[0;35m"
LIGHT_PURPLE="\033[1;35m"
BROWN="\033[0;33m"
YELLOW="\033[1;33m"
LIGHT_GRAY="\033[0;37m"
WHITE="\033[1;37m"
NO_COLOR="\033[0m"

# as an ugly hack I pass the hostname as an ENV to the remote host so that
# on exit it can reset the iterm tab title
export KOGENT_SSH_HOSTNAME=`hostname -s`

# make sure python loads our .pythonrc
export PYTHONSTARTUP="${HOME}/.pythonrc"

# set slimerjs binary on macos
if [[ -f "/Applications/Firefox.app/Contents/MacOS/firefox" ]]; then
  export SLIMERJSLAUNCHER="/Applications/Firefox.app/Contents/MacOS/firefox"
fi

# export EDITOR=$(which vim)


# Needed for golang
if [[ -d "${HOME}/dev/go" ]]; then
  export GOPATH="${HOME}/dev/go"
elif [[ -d "${HOME}/go" ]]; then
  export GOPATH="${HOME}/go"
fi

# FIXME: only run if docker-machine is present
# if [ "$(docker-machine status)" == "Running" ]; then
#   eval "$(docker-machine env)"
# else
#   echo "docker daemon stopped, run 'dockerboot' to start and set env"
# fi