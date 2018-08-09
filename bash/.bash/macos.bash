#bash-completion
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi
#bash-completion2
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi
#export ARCHFLAGS="x86_64"
alias mp4box="/Applications/Osmo4.app/Contents/MacOS/MP4Box"

export KOGENT_SSH_HOSTNAME=`hostname -s`
export SKYPEUSERNAME="kogentmark"

# System-wide .profile for sh(1)

#if [ -x /usr/libexec/path_helper ]; then
#	eval `/usr/libexec/path_helper -s`
#fi

export PATH="~/bin:~/dev/oss/golang/bin:~/.gem/ruby/1.8/bin:~/.ssh/argv0:$PATH"
# gnu path
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
#export GEM_HOME=/opt/local/lib/ruby/gems/1.8
export GOPATH="${HOME}/dev/go"
export PATH="${GOPATH}/bin:$PATH"
#source /Users/mcarey/.gvm/scripts/gvm

function godev() {
  cd "${GOPATH}/src/"
  pushd "github.com"
  pushd "kogent"
}

function work() {
  export CDPATH=".:~/dev/gw:~/dev:~/Google\ Drive/gw:~/Google\ Drive/gw/clients"
  export PATH=$PATH:~/Documents/gw/bin
}
function dev() {
  export CDPATH=".:~/dev:~/src"
}

function psmem() { ps aux | awk '/${1}/i {sum += $6} END { printf "%dMB", sum/1024 }'; }

#alias locate=/usr/bin/locate
alias fbs="fbcmd STREAM"
alias fix_tty="stty 6b02:3:4b00:200005cf:4:ff:ff:7f:17:15:12:0:3:1c:1a:19:11:13:ff:ff:1:0:ff:0"
alias tar="COPYFILE_DISABLE=true tar"

function llib { eval `perl -Mlocal::lib=$1`; };

#export SSH_AUTH_SOCK=/tmp/501/SSHKeychain.socket
export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)
if [ -n "${SSH_AUTH_SOCK}" ]; then
  ssh-add -m 2>/dev/null
else
  echo "ssh-agent not loaded"
fi

#export RBXOPT=-X19

alias portup='sudo port selfupdate && port outdated && growlnotify -s -m "`port outdated`"'
alias portupo="sudo port upgrade outdated"

# rvm installer added line:
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#chruby
[[ -s "/usr/local/opt/chruby/share/chruby/chruby.sh" ]] && source /usr/local/opt/chruby/share/chruby/chruby.sh
[[ -s "/usr/local/opt/chruby/share/chruby/auto.sh" ]] && source /usr/local/opt/chruby/share/chruby/auto.sh
rbi() {
  version="${1}"
  ruby-build "${version}" ~/.rubies/"${version}"
  chruby "${version}"
  if [ $? -eq 0 ]; then
    gem install bundler
  else
    echo "couldn't change rubies.  this is usually because the build failed.  you should look into that."
  fi
}
alias rubies="ruby-build --definitions"

#grc
source "$(brew --prefix)/etc/grc.bashrc"

#alias flushdns="sudo killall -HUP mDNSResponder"

export HISTFILE=~/.bash-history-${ITERM_SESSION_ID%:*}

alias screen=tmux
# iterm2 shell integration tools
[[ -e "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"
