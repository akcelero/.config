# . "${HOME}/.cargo/env"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}"/aws/credentials
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}"/aws/config

export RUFF_CACHE_DIR=${XDG_CACHE_HOME}/ruff

export KUBECONFIG="${XDG_CONFIG_HOME}/kube/config" 
export KUBECACHEDIR="${XDG_CACHE_HOME}/kube"

export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

export WINEPREFIX="${XDG_DATA_HOME}/wine"

export SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"

