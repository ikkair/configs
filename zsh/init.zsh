CONFIG_PATH_ZSH="$(dirname "$0")"

# Cores
source $CONFIG_PATH_ZSH/src/core/path.zsh
source $CONFIG_PATH_ZSH/src/core/env.zsh
source $CONFIG_PATH_ZSH/src/core/programs.zsh

# Plugins
source $CONFIG_PATH_ZSH/src/plugins/zsh-autosuggestions.zsh
source $CONFIG_PATH_ZSH/src/plugins/mpv.zsh
source $CONFIG_PATH_ZSH/src/plugins/nvim.zsh
source $CONFIG_PATH_ZSH/src/plugins/chezmoi-completion.zsh

