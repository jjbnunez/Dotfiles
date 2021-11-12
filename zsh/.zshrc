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
