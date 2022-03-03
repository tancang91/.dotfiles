#/usr/bin/env bash

app_packages=(
    'lshw'
    'openssh'
    'keychain'
    'gcc'
    'curl'
    'wget'
    'python'
    'nodejs'
    'npm'
    'neofetch'
    'ripgrep'
    'jq'
    'fzf'
    'gitui'
    'tldr'
    'htop'
    'ranger'
    'exa'
    'bat'
)

function alacritty_install {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    mkdir -p "${HOME}/software"
    pushd "${HOME}/software"

    git clone https://github.com/alacritty/alacritty.git
    cd alacritty
    cargo build --release

    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    popd
}

function xmonad_install {
    sudo pacman -Sy cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon
    cargo build --release

    sudo pacman -Sy xorg \
                    xorg-xinit \
                    xmonad \
                    xmonad-contrib \
                    xmobar \
                    dmenu \
                    nitrogen \
                    picom \
                    alsa-utils \
                    firefox

    alacritty_install
}

function app_install {
    sudo pacman -Sy steam lib32-fontconfig ttf-liberation wqy-zenhei lib32-systemd
    sudo pacman -Sy vlc qbittorrent
}

function zsh_install {
    sudo pacman -Sy --needed --noconfirm git curl zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}


sudo pacman -Syy
for package in ${app_packages[@]}; do
    echo -e "\033[32m===== Install package \033[32;1m${package}\033[0m"
    sudo pacman -S --needed --noconfirm ${package}
done

#source ./install-config.sh
