#/usr/bin/env bash

function cn_vim {
    local dir=$1
    if [[ -d "${dir}" ]]; then
        nvim $(find ${dir} -type f | fzf)
    else
        nvim $(fzf)
    fi
}

function cn_java {
    local version=$1

    case $(uname -s) in
        Darwin)
            export JAVA_HOME=$(/usr/libexec/java_home -v ${version})
        ;;

        Linux)
            echo "Linux: TODO"
        ;;

        *)
        ;;
    esac
}
