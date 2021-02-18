#/usr/bin/env bash

function cn_vim {
    local dir=$1
    if [[ -d "${dir}" ]]; then
        nvim $(find ${dir} -type f | fzf)
    else
        nvim $(fzf)
    fi
}
