# . "${HOME}/.cargo/env"
# =============================================================================
# SECURITY SETTINGS
# =============================================================================
umask 022

# =============================================================================
# EXPORT ENV VARIABLES
# =============================================================================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat

export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export KUBECONFIG="${XDG_CONFIG_HOME}/kube/config" 
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

export WINEPREFIX="${XDG_DATA_HOME}/wine"

export SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"
export RUFF_CACHE_DIR="${XDG_CACHE_HOME}/ruff"
export KUBECACHEDIR="${XDG_CACHE_HOME}/kube"

eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -z ${TMUX} && ${TERM} != screen && -z "${KITTY_WINDOW_ID}" && "${TERMINAL_EMULATOR}" != "JetBrains-JediTerm" ]]; then
    exec tmux new-session -A -s main
fi
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# =============================================================================
# EXTERNAL TOOL INITIALIZATION
# =============================================================================
eval "$(mise activate zsh)"

