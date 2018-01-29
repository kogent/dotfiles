[[ -s "${HOME}/.shrc" ]] && source "${HOME}/.shrc"
[[ -s "${HOME}/.bash/config.bash" ]] && source "${HOME}/.bash/config.bash"
[[ -s "${HOME}/.bash/init.bash" ]] && source "${HOME}/.bash/init.bash"

[[ -s "${HOME}/.sh/variables.bash" ]] && source "${HOME}/.sh/variables.bash"
[[ -s "${HOME}/.bash/aliases.bash" ]] && source "${HOME}/.bash/aliases.bash"
[[ -s "${HOME}/.bash/functions.bash" ]] && source "${HOME}/.bash/functions.bash"
[[ -s "${HOME}/.bash/completions.bash" ]] && source "${HOME}/.bash/completions.bash"
[[ -s "${HOME}/.bash/paths.bash" ]] && source "${HOME}/.bash/paths.bash"
if [[ "$(uname -s)" == 'Darwin' ]]; then
    [[ -s "${HOME}/.bash/macos.bash" ]] && source "${HOME}/.bash/macos.bash"
elif [[ "$(uname -s)" == 'Linux' ]]; then
    [[ -s "${HOME}/.sh/linux.bash" ]] && source "${HOME}/.sh/linux.bash"
fi
[[ -s "${HOME}.local/rc.bash" ]] && source "${HOME}/.local/rc.bash"


