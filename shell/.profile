export PATH=$HOME/.local/bin/$(hostname):$HOME/.local/bin/$(uname -m):~/bin:$HOME/.local/bin:$PATH
export EDITOR=vim
export LANG=en_GB.UTF-8

export LINUXBREW_DIR="/home/linuxbrew/.linuxbrew"
# export HOMEBREW_CELLAR="$LINUXBREW_DIR/Cellar"
# export HOMEBREW_PREFIX="$LINUXBREW_DIR"
# export HOMEBREW_REPOSITORY="$LINUXBREW_DIR/Homebrew"
export NVM_DIR="$HOME/.config/nvm"
export NVM_HOMEBREW="$LINUXBREW_DIR/opt/nvm"

export XDG_CONFIG_HOME="$HOME/.config"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"

export GIT_SOURCE_HOME="$HOME/Code"
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH"
export PYTHONDONTWRITEBYTECODE=1

if [ -f $HOME/.path_profile ]; then
    source $HOME/.path_profile
else
    source ./zsh/.path_profile
fi
