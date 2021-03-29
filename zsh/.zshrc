# We must source our aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# We set options here
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

# We set up autocompletion
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# Allow autoloading of external scripts
fpath=($ZDOTDIR/external $fpath)

# Autoload our prompt purification setup
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Autoload vi mode cursor adjustment
autoload -Uz cursor_mode && cursor_mode

# Set up hjkl keys to navigate the auto-completion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Use Neovim to directly edit what you type at the command-line prompt
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Source the zsh syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source the zsh bd plugin
source ~/dotfiles/zsh/external/bd.zsh

# Source our own scripts
source ~/dotfiles/zsh/scripts.sh
