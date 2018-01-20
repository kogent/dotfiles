[[ -s "${HOME}/.shrc" ]] && source "${HOME}/.shrc"
[[ -s "${HOME}/.bash/config.bash" ]] && source "${HOME}/.bash/config.bash"
[[ -s "${HOME}/.bash/aliases.bash" ]] && source "${HOME}/.bash/aliases.bash"
[[ -s "${HOME}/.bash/completions.bash" ]] && source "${HOME}/.bash/completions.bash"
[[ -s "${HOME}/.bash/paths.bash" ]] && source "${HOME}/.bash/paths.bash"
if [[ "$(uname -s)" == 'Darwin' ]]; then
    [[ -s "${HOME}/.bash/macos.bash" ]] && source "${HOME}/.bash/macos.bash"
fi
[[ -s "${HOME}.local/rc.bash" ]] && source "${HOME}/.local/rc.bash"

# Load RVM into a shell session *as a function*
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"

# iterm2 shell integration tools
[[ -e "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"
