# install zgen if not present
if [ ! -f "${HOME}/.zgen/zgen.zsh" ]; then
  git clone git@github.com:tarjoilija/zgen.git "${HOME}/.zgen/"
fi
# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then
  # specify plugins here
#  # zgen oh-my-zsh
  # zgen oh-my-zsh plugins/git
  # zgen oh-my-zsh plugins/sudo
  # zgen oh-my-zsh plugins/command-not-found
  # zgen oh-my-zsh plugins/z
  zgen oh-my-zsh plugins/iterm2
#  # zgen load zsh-users/zsh-syntax-highlighting
  # zgen load zdharma/fast-syntax-highlighting
  # zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src
  # zgen load bhilburn/powerlevel9k powerlevel9k
  zgen load romkatv/powerlevel10k powerlevel10k
  # zgen load MichaelAquilina/zsh-emojis
  # zgen load b4b4r07/emoji-cli
  zgen load zpm-zsh/autoenv
  # zgen load andrewferrier/fzf-z
  # zgen load blimmer/zsh-aws-vault
  zgen load iam4x/zsh-iterm-touchbar
  # generate the init script from plugins above
  zgen save
fi
alias zgencfgupdate="zgen reset && echo 'launch a new shell to refresh zgen config'"
