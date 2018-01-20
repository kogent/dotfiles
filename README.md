# dotfiles
For the shell dotfiles, common config is in shell_common.  These files are sourced by both bash and zsh.
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
* ruby
    * rvm
* python
    * pipenv

## Install
To install these dotfiles run the install script:
```./install_dotfiles.sh```
