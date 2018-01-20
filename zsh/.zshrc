[[ -s "${HOME}/.zsh/init.zsh" ]] && source "${HOME}/.zsh/init.zsh"
[[ -s "${HOME}/.shrc" ]] && source "${HOME}/.shrc"
[[ -s "${HOME}/.zsh/paths.zsh" ]] && source "${HOME}/.zsh/paths.zsh"


[[ -s "${HOME}/.zsh/aliases.zsh" ]] && source "${HOME}/.zsh/aliases.zsh"
[[ -s "${HOME}/.zsh/functions.zsh" ]] && source "${HOME}/.zsh/functions.zsh"
[[ -s "${HOME}/.zsh/theme.zsh" ]] && source "${HOME}/.zsh/theme.zsh"
[[ -s "${HOME}/.zsh/zgen.zsh" ]] && source "${HOME}/.zsh/zgen.zsh"
[[ -s "${HOME}/.zsh/config.zsh" ]] && source "${HOME}/.zsh/config.zsh"
if [[ "$(uname -s)" == 'Darwin' ]]; then
    [[ -s "${HOME}/.zsh/macos.zsh" ]] && source "${HOME}/.bash/macos.zsh"
fi
[[ -s "${HOME}/.local/rc.zsh" ]] && source "${HOME}/.local/rc.zsh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

