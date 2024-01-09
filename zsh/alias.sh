#!/usr/bin/env bash

### Alias land
alias n="/usr/bin/ninja"
alias p="/usr/bin/python3"
alias vim="nvim"

alias csleep="systemctl suspend"
alias top10='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n10'

# Remapping program
alias l='eza -l --group-directories-first'
alias la='eza -la --group-directories-first'
alias cat='bat --paging=never'

alias aliasconf="nvim ${HOME}/dotfiles/zsh/alias.sh"
alias zshconf="nvim ${HOME}/.zshrc"
alias gitconf="nvim ${HOME}/.gitconfig"
alias vimconf="nvim ${HOME}/.config/nvim/init.lua"
