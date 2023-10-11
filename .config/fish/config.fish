if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
set -Ux EDITOR helix

# Aliases
alias ls='lsd --group-directories-first'                          
alias la='lsd -a --group-directories-first'                       
alias lsa='lsd -la --group-directories-first'

alias cat='bat'                                                   
alias chth='kitty +kitten themes'                                 
alias h='helix'
alias hr='Hyprland'                                               
alias df='df -h'
# Git
alias gs='git status'                                             
alias ga='git add'                                                
alias gc='git commit -m'                                          
alias gp='git push'                                               
alias bare='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME/dotfiles/ --work-tree=$HOME'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

#Neofetch
neofetch

# Path
fish_add_path -g ~/.local/bin

# Starship prompt
starship init fish | source




