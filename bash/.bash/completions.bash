source "${HOME}/.sh/completion_scripts/git_completion"
complete -C "${HOME}/.sh/completion_scripts/rake_completion" -o default rake
complete -C "${HOME}/.sh/completion_scripts/project_completion" -o default c
complete -C "${HOME}/.sh/completion_scripts/capistrano_completion" -o default cap
source "${HOME}/.sh/completion_scripts/push_monarch_completion"
