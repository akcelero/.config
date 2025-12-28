#! /usr/bin/env zsh

brew_install() {
    echo "Installing brew packages"

    brew tap jandedobbeleer/oh-my-posh || true
    brew install git tmux oh-my-posh font-hack-nerd-font uv bat fastfetch
    brew install --cask ghostty
}

simple_ln() {
    echo "Installing simple configs"

    local CONFIGS=(bat fastfetch ghostty git ohmyposh)

    for CONFIG in "${CONFIGS[@]}"; do
        echo "Creating symlink for $CONFIG"
        ln -sfn $PWD/$CONFIG $XDG_CONFIG_HOME
    done
}

install_tmux() {
    echo "Installing tmux config"

    local TMUX_HOME="$XDG_CONFIG_HOME/tmux"
    [ ! -d $TMUX_HOME ] && mkdir $TMUX_HOME

    local TPM_HOME="$XDG_CONFIG_HOME/tmux/plugins/tpm"
    [ ! -d $TPM_HOME/.git ] && git clone https://github.com/tmux-plugins/tpm $TPM_HOME

    ln -sfn "$PWD/tmux/tmux.conf" "$TMUX_HOME"
    tmux source "$XDG_CONFIG_HOME/tmux/tmux.conf"

    $XDG_CONFIG_HOME/tmux/plugins/tpm/scripts/install_plugins.sh
}

install_zsh() {
    echo "Installing ZSH config"

    mkdir -p "$XDG_CONFIG_HOME/zsh"
    ln -sfn "$PWD/zsh/.zlogin" "$XDG_CONFIG_HOME/zsh"
    ln -sfn "$PWD/zsh/.zprofile" "$XDG_CONFIG_HOME/zsh"
    ln -sfn "$PWD/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
    ln -sfn "$PWD/zsh/.zshenv" "$HOME"

    local ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
    [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
    [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    source "${ZINIT_HOME}/zinit.zsh"
}

install_nvim() {
    ln -sfn "$PWD/nvim" $XDG_CONFIG_HOME
    nvim --headless -c 'autocmd User LazySync quitall' -c 'Lazy sync' > /dev/null 2>&1
}

# brew_install
# simple_ln
# install_tmux
# install_zsh
install_nvim

