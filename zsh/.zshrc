#!/usr/bin/env zsh
# zmodload zsh/zprof
# =============================================================================
# SECURITY SETTINGS
# =============================================================================
umask 022

# =============================================================================
# HISTORY CONFIGURATION
# =============================================================================
HISTSIZE=5000
HIST_STAMPS="mm/dd/yyyy"
HISTFILE="${XDG_CONFIG_HOME}/zsh/.zsh_history"
SAVEHIST=${HISTSIZE}
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# =============================================================================
# SHELL OPTIONS
# =============================================================================
setopt autocd                     # cd by typing directory name
setopt auto_param_slash           # add slash after directory completion
setopt auto_pushd                 # make cd push old directory onto stack
setopt pushd_ignore_dups          # don't push duplicates onto stack

setopt autolist                   # automatically list choices on ambiguous completion
setopt auto_menu                  # show completion menu on tab press
setopt complete_in_word           # allow completion in middle of word

setopt interactive_comments       # allow comments in interactive shell
setopt no_beep                    # disable beep
setopt correct                    # try to correct spelling
setopt notify                     # report status of background jobs immediately
setopt prompt_subst               # allow parameter expansion in prompt

# =============================================================================
# ALIASES
# =============================================================================
alias m='mise'
alias j='just'
alias v='nvim'
alias vim='nvim'
alias c='bat'
alias cat='bat'
alias d='docker'
alias dc='docker-compose'
alias k='kubectl'
alias tf='terraform'
alias py='uv run python'

alias zshrc='nvim ${XDG_CONFIG_HOME}/zsh/'
alias tmuxconfig='nvim ${XDG_CONFIG_HOME}/tmux/tmux.conf'
alias nvimconfig='nvim ${XDG_CONFIG_HOME}/nvim/'
alias ghosttyconfig='nvim ${XDG_CONFIG_HOME}/ghostty/config'

alias reload='source ${XDG_CONFIG_HOME}/zsh/.zshrc'

# =============================================================================
# EXTERNAL TOOL INITIALIZATION
# =============================================================================
eval "$(mise activate zsh)"
eval "$(fzf --zsh)"

# =============================================================================
# PLUGINS
# =============================================================================
ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
# UNCOMMENT WHEN NEEDED
# mkdir -p "$(dirname $ZINIT_HOME)"
# git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1 turbo
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice turbo
zinit light Aloxaf/fzf-tab

zinit ice turbo from"gh-r" as"completion" pick"*/*.zsh" atload"compinit -C -d ${XDG_CACHE_HOME}/zsh/.zcompdump"
zinit light zsh-users/zsh-completions

# Oh My Zsh snippets (lazy loaded)
zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::aws \
    OMZP::aliases \
    OMZP::command-not-found \
    OMZP::git \
    OMZP::golang \
    OMZP::kubectl \
    OMZP::kubectx \
    OMZP::sudo \
    OMZP::uv

# =============================================================================
# COMPLETION SYSTEM
# =============================================================================
autoload -Uz compinit
compinit -u -C -d "${XDG_CACHE_HOME}/zsh/.zcompdump"
_comp_options+=(globdots)
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/.zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# fzf-tab configuration
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Git completion styling
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'

# =============================================================================
# SECRETS AND PRIVATE CONFIGURATION
# =============================================================================
[[ -f "${XDG_CONFIG_HOME}/zsh/.zshenv_secrets" ]] && source "${XDG_CONFIG_HOME}/zsh/.zshenv_secrets"

# =============================================================================
# PROMPT INITIALIZATION (KEEP LAST)
# =============================================================================
# this file will be always run in tmux (guaranteed by .zprofile)
# so $TERM_PROGRAM will always be != "Apple_Terminal"
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME}/ohmyposh/config.toml)"
# fi
# zprof

