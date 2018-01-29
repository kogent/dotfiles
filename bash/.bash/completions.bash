# TODO move these to shell_common and/or ~/.local/
# TODO completions might make more sense being extracted to a separate repo or
# colocated with the corresponding tool and installed to a common area that is autoloaded
source "${HOME}/.sh/completion_scripts/git_completion"
complete -C "${HOME}/.sh/completion_scripts/rake_completion" -o default rake
complete -C "${HOME}/.sh/completion_scripts/project_completion" -o default c
complete -C "${HOME}/.sh/completion_scripts/capistrano_completion" -o default cap
source "${HOME}/.sh/completion_scripts/push_monarch_completion"
