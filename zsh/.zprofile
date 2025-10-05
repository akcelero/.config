eval "$(/opt/homebrew/bin/brew shellenv)"
if [[ -z $TMUX && $TERM != screen && "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
    exec tmux new-session -A -s main
fi
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

