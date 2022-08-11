# For local bin
export PATH="$HOME/.local/bin:$PATH"

# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Set default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Determine where config files for zsh are
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"

# Maximum events for internal history
export HISTSIZE=10000

# Maximum events in history file
export SAVEHIST=10000

# Define an env var for our dotfiles directory
export DOTFILES="$HOME/Dotfiles"

# Modify fzf behavior to use ripgrep instead of grep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
