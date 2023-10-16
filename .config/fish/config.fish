if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
set -Ux EDITOR nvim
set -U fish_escape_delay_ms 100

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
alias rn='ranger'
alias vi='nvim'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Sudo plugin
function sudope -d "Quickly toggle sudo prefix"

    # Save the current command line and cursor position.
    set -l command_buffer (commandline)
    set -l cursor_position (commandline -C)

    # If the command line is empty, pull the last command from history.
    if test -z "$command_buffer"
        set command_buffer $history[1]
    end

    # Parse the command line (first line only).
    set -l command_parts (string match -ir '^(\s*)(sudo(\s+|$))?(.*)' $command_buffer[1])

    # Handle multiline commands with extra care.
    set -l command_lines_count (count $command_buffer)
    test $command_lines_count -gt 1
    and set -l command_rest $command_buffer[2..$command_lines_count]

    switch (count $command_parts)
        case 3
            # No "sudo".

            # Add "sudo" to the beginning of the command, after any leading whitespace (if present).
            commandline -r (string join \n (string join '' $command_parts[2] 'sudo ' $command_parts[3]) $command_rest)

            # Push the cursor position ahead if necessary (+5 for 'sudo ').
            test $cursor_position -ge (string length -- "$command_parts[2]")
            and set cursor_position (math $cursor_position+5)

            # Place the cursor where it was (or where it should be).
            commandline -C $cursor_position

        case 5
            # "sudo" is present in the beginning of the command.

            # Remove "sudo", leave any leading whitespace (if present).
            commandline -r (string join \n (string join '' $command_parts[2 5]) $command_rest)

            # Push the cursor position back if appropriate ('sudo' and whitespace).
            set -l lead_length (string length -- "$command_parts[2]")
            set -l sudo_length (string length -- "$command_parts[3]")
            if test $cursor_position -ge (math $lead_length+$sudo_length)
                # The cursor was after "sudo".
                set cursor_position (math $cursor_position-$sudo_length)
            else if test $cursor_position -ge $lead_length
                # The cursor was somewhere on "sudo".
                set cursor_position $lead_length
            end

            # Place the cursor where it was (or where it should be).
            commandline -C -- $cursor_position
    end
end

#Neofetch
neofetch

# Path
fish_add_path -g ~/.local/bin

# Starship prompt
starship init fish | source
