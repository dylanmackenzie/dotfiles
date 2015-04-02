# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

if [ -f ~/dotfiles/aliases ]; then
	. ~/dotfiles/aliases
fi

export EDITOR="vim"
export PATH="/usr/local/heroku/bin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/home/@USERNAME@/.local/bin:/usr/local/sbin:/usr/sbin:$GOPATH/bin"

eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Github auth token
export GITHUB_AUTH="1f69a56cae78f19114b13fe695f8e2a718266088"
