#/usr/bin/env bash

function cnvi {
    local dir=$1
    if [[ -d "${dir}" ]]; then
        nvim $(find ${dir} -type f | fzf)
    else
        nvim $(fzf)
    fi
}

