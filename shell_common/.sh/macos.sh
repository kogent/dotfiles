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