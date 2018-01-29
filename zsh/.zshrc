# load grc early so overrides can take affect
[[ -f "$(brew --prefix)/etc/grc.zsh" ]] && source "$(brew --prefix)/etc/grc.zsh"
# source common shell config so overrides can take effect
[[ -s "${HOME}/.shrc" ]] && source "${HOME}/.shrc"

[[ -s "${HOME}/.zsh/config.zsh" ]] && source "${HOME}/.zsh/config.zsh"
[[ -s "${HOME}/.zsh/init.zsh" ]] && source "${HOME}/.zsh/init.zsh"
[[ -s "${HOME}/.sh/variables.zsh" ]] && source "${HOME}/.sh/variables.zsh"
[[ -s "${HOME}/.zsh/paths.zsh" ]] && source "${HOME}/.zsh/paths.zsh"
[[ -s "${HOME}/.zsh/aliases.zsh" ]] && source "${HOME}/.zsh/aliases.zsh"
[[ -s "${HOME}/.zsh/functions.zsh" ]] && source "${HOME}/.zsh/functions.zsh"
[[ -s "${HOME}/.zsh/theme.zsh" ]] && source "${HOME}/.zsh/theme.zsh"
[[ -s "${HOME}/.zsh/zgen.zsh" ]] && source "${HOME}/.zsh/zgen.zsh"
if [[ "$(uname -s)" == 'Darwin' ]]; then
    [[ -s "${HOME}/.zsh/macos.zsh" ]] && source "${HOME}/.bash/macos.zsh"
elif [[ "$(uname -s)" == 'Linux' ]]; then
    [[ -s "${HOME}/.sh/linux.zsh" ]] && source "${HOME}/.sh/linux.zsh"
fi
# local system overrides, should be backed up but not in dotfiles repo
[[ -s "${HOME}/.local/rc.zsh" ]] && source "${HOME}/.local/rc.zsh"


