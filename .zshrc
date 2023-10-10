# Aliases
alias ls='lsd --group-directories-first'
alias la='lsd -a --group-directories-first'
alias lsa='lsd -la --group-directories-first'

alias cat='bat'
alias chth='kitty +kitten themes'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias hr='Hyprland'
alias reload='source .zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


# Helix
HELIX_RUNTIME=/.local/share/lib/helix/runtime

#History
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000
export HISTSIZE=1000


# Path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# Zsh autosuggestions history
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Neofetch
neofetch

# Starship Promp (Always place at the end of the file)
eval "$(starship init zsh)"

