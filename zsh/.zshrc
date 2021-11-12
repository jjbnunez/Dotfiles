# Source aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Set and unset some options 
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# Autoload the completion system
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# Enable ability to autoload everything in the 'external' directory
#   By prepending the external path to the current $fpath variable,
#   we ensure that zsh will first search in the 'external' dir for
#   any function we want to autoload, BEFORE anywhere else.
fpath=($ZDOTDIR/external $fpath)

# Autoload the prompt purification script
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# Enable the vi mode
bindkey -v
export KEYTIMEOUT=1

# Load changing cursor script for vi mode
autoload -Uz cursor_mode && cursor_mode

# Set up hjkl to navigate the autocompletion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Set up zsh to use neovim to directly edit what you type at the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Source our directory-jumper script
source ~/dotfiles/zsh/external/bd.zsh

# Source the fuzzy finder
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Auto start i3
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "XDG_CONFIG_HOME/X11/.xinitrc"
fi

# Source the syntax highlighting plugin
# SOURCE THIS AT THE BOTTOM OF THE FILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
