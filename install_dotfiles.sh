#!/bin/bash
if [[ ! -x "$(which stow)" ]]; then
    echo "please install gnu stow to install dotfiles"
    exit 1
fi
if [[ ! -x "$(which git)" ]]; then
    echo "please install git to install dotfiles"
    exit 1
fi

stow --target=${HOME} bash
stow --target=${HOME} misc
stow --target=${HOME} python
stow --target=${HOME} ruby
stow --target=${HOME} shell_common
stow --target=${HOME} vim
stow --target=${HOME} zsh

# vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# symlink ~/.local to ./local
if [[ ! -L "./local" ]]; then
    if [[ -e "./local" ]]; then
        echo "WARNING: local directory exists but is not a link"
    fi
    ln -s "${HOME}/.local/" "./local"
fi