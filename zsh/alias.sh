#!/usr/bin/env bash

### Alias land
alias n="/usr/bin/ninja"
alias p="/usr/bin/python3"
alias qbittorrent='qbittorrent > /dev/null 2>&1 &disown'
alias steam="steam > /dev/null 2>&1 &disown"
alias idea="/opt/idea-IU-211.7628.21/bin/idea.sh > /dev/null 2>&1 &disown"
alias postman="/opt/Postman/Postman > /dev/null 2>&1 &disown"
alias word="wps > /dev/null 2>&1 &disown"
alias excel="et > /dev/null 2>&1 &disown"
alias powerpoint="wpp > /dev/null 2>&1 &disown"

alias csleep="systemctl suspend"

alias fixvideo='nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"'
alias top10='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n10'

# Remapping program
alias l='exa -l --group-directories-first'
alias la='exa -la --group-directories-first'
alias cat='bat --paging=never'

alias aliasconf="nvim ${HOME}/dotfiles/zsh/alias.sh"
alias zshconf="nvim ${HOME}/.zshrc"
alias gitconf="nvim ${HOME}/.gitconfig"
alias vimconf="nvim ${HOME}/.config/nvim/init.vim"
