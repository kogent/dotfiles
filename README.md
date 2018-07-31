# dotfiles
Finally making the effort to give zsh a go.  Refactored my bash dotfiles so that much of it could be sourced by both bash and zsh.  Made the switch to stow since it is more generic than rake.  Added a few other config that needed to be preserved.

For things that should not be commited to the repo you can put them into $HOME/.local/rc.zsh or $HOME/.local/rc.bash depending on your they will be automatically be sourced.

## Prequisites
* GNU stow
    * macOS
    ```brew install stow```
    * CentOS/RHEL
    ```yum -y install stow```
    * Debian/Ubuntu
    ```apt -y install stow```
* git
* zsh
    * zgen
* ruby
    * rvm
* python
    * pipenv

## Install
To install these dotfiles run the install script:
```./install_dotfiles.sh```

## Notes

# zsh
Using zgen to load plugins from various frameworks.

Theme is powerlevel9k:
https://github.com/bhilburn/powerlevel9k

The order of loading these files is important since there are dependencies, eg- the theme variables need to be loaded before the theme.

# bash
Most of the useful stuff has been moved to shell_common

# shell_common
previously bash profile stuff refactored to syntax that works in both bash and zsh.

# vim
Using Vundle for loading of plugins

# python
.pythonrc is not loaded by default and needs to be pointed to in a PYTHONSTARTUP env var. (See shell_common/.sh/variables.sh)

# .local
each of the shell rc files will source ~/.local/$SHELL.rc.  Anything that is machine specific should go in here.  These changes will not be saved in the git repo.

# os specific
Anything that OS platform specific that should be preserved should go in a $OS.$SHELL file.  eg- mac zsh settings should go in macos.zsh.