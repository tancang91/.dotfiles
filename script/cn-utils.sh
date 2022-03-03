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

function cn_jetbrain {
    local JB_PRODUCTS=("IntelliJIdea" "CLion" "PhpStorm" "GoLand" "PyCharm" "WebStorm" "Rider" "DataGrip" "RubyMine" "AppCode")

    case $(uname -s) in
        Darwin)
            echo "Darwin"
            for product in ${JB_PRODUCTS[@]}; do
                  echo "Closing $product"

                  echo "Resetting trial period for $product"

                  echo "removing evaluation key..."
                  rm -rf ~/Library/Application\ Support/JetBrains/${product}*/eval

                  echo "removing all evlsprt properties in options.xml..."
                  sed -i '' '/evlsprt/d' ~/Library/Application\ Support/JetBrains/${product}*/options/other.xml

                echo
            done

            echo "removing additional plist files..."
            rm -f ~/Library/Preferences/com.apple.java.util.prefs.plist
            rm -f ~/Library/Preferences/com.jetbrains.*.plist
            rm -f ~/Library/Preferences/jetbrains.*.*.plist

            echo "restarting cfprefsd"
            killall cfprefsd
        ;;

        Linux)
            echo "Linux"
            while read -r PRD; do
                test -d "${PRD}/eval/" && rm -rf "${PRD}/eval/"
                test -f "${PRD}/options/other.xml" && rm -rf "${PRD}/options/other.xml"
            done < <(find "${HOME}/.config/JetBrains" -maxdepth 1 -type d)

            rm -rf "${HOME}/.local/share/JetBrains/consentOptions"
            rm -rf "${HOME}/.java/.userPrefs"
        ;;

        *)
            echo "shit"
        ;;
    esac
}

