# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
export EDITOR=nvim
export VISUAL=nvim
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/moni/.zshrc'
zstyle ':autocomplete:*' default-context history-incremental-search-backward
zstyle ':autocomplete:*' min-input 3

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# User configuration

# Path
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin
export PATH=$PATH:/home/moni/.local/bin/


# Aliases
alias ls='lsd --group-directories-first'
alias la='lsd -a --group-directories-first'
alias lsa='lsd -la --group-directories-first'
alias sl='sl | lolcat'
alias cat='bat'
alias chth='kitty +kitten themes'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias hr='Hyprland'
alias reload='source .zshrc'
alias vi='nvim'
alias rn='ranger'
alias sduo='sudo'
alias pa='source env/bin/activate'
alias fb='fzf --preview "bat --style=numbers --color=always --line-range=:500 {}" --bind "enter:execute(sleep 0.1; nvim {})"'
alias rb='sudo reboot now'
alias pq='pacman -Q | wc -l' 
alias se='sudoedit'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# DT's clear
alias c='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'

# Plugins
source /home/moni/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/moni/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/moni/.zsh/zsh-sudo-plugin/sudo.plugin.zsh

# Functions
spark() {
  local OPTIND opt
  local min="" max="" version=0 help=0

  while getopts "vh-:" opt; do
    case "$opt" in
      -)
        case "${OPTARG}" in
          min=*)
            min=${OPTARG#*=}
            ;;
          max=*)
            max=${OPTARG#*=}
            ;;
          version)
            version=1
            ;;
          help)
            help=1
            ;;
        esac
        ;;
      v)
        version=1
        ;;
      h)
        help=1
        ;;
    esac
  done
  shift $((OPTIND - 1))

  if (( version )); then
    echo "spark, version 1.1.0"
  elif (( help )); then
    echo "Usage: spark <numbers ...>"
    echo "       stdin | spark"
    echo "Options:"
    echo "       --min=<number>   Minimum range"
    echo "       --max=<number>   Maximum range"
    echo "       -v or --version  Print version"
    echo "       -h or --help     Print this help message"
    echo "Examples:"
    echo "       spark 1 1 2 5 14 42"
    echo "       seq 64 | sort --random-sort | spark"
  elif (( $# )); then
    printf "%s\n" "$@" | spark --min="$min" --max="$max"
  else
    awk -v min="$min" -v max="$max" '
      {
        m = (min == "" ? (m == "" ? $0 : (m > $0 ? $0 : m)) : min)
        M = (max == "" ? (M == "" ? $0 : (M < $0 ? $0 : M)) : max)
        nums[NR] = $0
      }
      END {
        n = split("▁ ▂ ▃ ▄ ▅ ▆ ▇ █", sparks, " ") - 1
        for (i = 1; i <= NR; i++) 
          printf("%s", sparks[(M == m ? 3 : sprintf("%.f", (1 + (nums[i] - m) * n / (M - m))))])
      }
    ' && echo
  fi
}

# Launch tmux when terminal opens
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# DT's colorscript
bash ~/color-scripts/color-scripts.sh
# Starship
eval "$(starship init zsh)"

eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
