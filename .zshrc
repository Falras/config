# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# default editor
export EDITOR=/usr/bin/nvim

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

source /usr/share/nvm/init-nvm.sh

nvm use --lts 1>/dev/null

alias config='/usr/bin/git --git-dir=/home/farlas/.cfg/ --work-tree=/home/farlas'
