# ls
if [ -f /usr/local/opt/coreutils/libexec/gnubin/ls ]; then
    alias ls='/usr/local/opt/coreutils/libexec/gnubin/ls --color=auto'
else
    alias ls="ls --color=auto"
fi
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

alias swhich='/usr/bin/which'
alias less='less -r'

alias rmd160sum="openssl dgst -ripemd160"
alias ssh="TERM=xterm-256color ssh"
alias sshexit="ssh -O exit"
alias get_http_headers="curl -o /dev/null -s -S -D - "
alias rsync="rsync --progress"

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gpb='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# ssl client
alias telnets='openssl s_client -connect'

# naive dump of http traffic.
# TODO: create tshark filters
alias httpdump="echo \"tcpdump -n -s 0 -w - | grep -a -o -E 'Host\: .*|GET \/.*'\""

# make ansible output json, requires json callback plugin to be installed and enabled
alias ansible-json="ANSIBLE_STDOUT_CALLBACK=json ansible"

alias listening_ports="lsof -Pn -i4"

alias urldecode='python3 -c "import sys, urllib.parse as ul;  [print(ul.unquote_plus(l), end=\"\") for l in sys.stdin]"'

if [ -x $(which bat) ]; then alias cat='bat'; fi
