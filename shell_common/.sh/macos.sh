export SLIMERJSLAUNCHER="/Applications/Firefox.app/Contents/MacOS/firefox"

#alias sudolog="sudo log show --style syslog --predicate 'process == \"sudo\" and not eventMessage contains \"visudo\"' --last 1h"
alias sudolog="sudo log show --style syslog --predicate 'process == \"sudo\" --last 1h"

alias ovftool="/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool"

function skypequery(){
  query=$1
  /usr/bin/env sqlite3 ~/Library/Application\ Support/Skype/${SKYPEUSERNAME}/main.db  "${query}"
}

function skypesearch(){
  searchstring=$1
  skypequery "
    select author, datetime(timestamp, 'unixepoch', 'localtime'), body_xml
      from messages
      where body_xml like '%${searchstring}%';
  "
}
# alias ss="skypesearch"
function ssm(){
  skypequery " select body_xml from messages where body_xml like '%${searchstring}%'; "
}

alias wakedell="wakeonlan 00:1a:a0:22:54:20"
alias mvim="DYLD_FORCE_FLAT_NAMESPACE=1 mvim"
#alias report="pushd ~/dev/gw/gwcm-client && bin/get_resolved_issues.rb -r; popd"

alias tar="COPYFILE_DISABLE=true tar"
alias vim="vim -X"
alias flushnetperms="sudo /usr/bin/dscacheutil -flushcache && sudo /usr/bin/dsmemberutil flushcache && sudo killall Finder"

function dockerenv() {
  $(boot2docker shellinit)
}

function startdocker() {
  boot2docker up
  dockerenv
}
function dev() {
  export CDPATH=".:~/dev:~/src"
}
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


export SSH_AUTH_SOCK=$(launchctl getenv SSH_AUTH_SOCK)
