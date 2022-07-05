if test -d /home/linuxbrew
    set -gx LINUXBREW_DIR "/home/linuxbrew/.linuxbrew"
    set -gx LD_LIBRARY_PATH "/home/linuxbrew/.linuxbrew/lib" $LD_LIBRARY_PATH
    set PATH $LINUXBREW_DIR/sbin $LINUXBREW_DIR/bin $LINUXBREW_DIR/opt/python/libexec/bin $PATH
end

set -gx LD_LIBRARY_PATH "/usr/local/lib64" "/usr/lib64" $LD_LIBRARY_PATH
########
# PATH #
########

# set PATH $PATH $XDG_CONFIG_HOME/composer/vendor/bin
# set PATH $PATH $LINUXBREW_DIR/opt/mysql-client@5.7/bin
set PATH $HOME/.asdf/shims $PATH
# set PATH $PATH $HOME/.pyenv/shims

set PATH $HOME/.local/bin/(hostname) $HOME/.local/bin/(uname -m) $HOME/bin $HOME/.local/bin $PATH

############
# DEFAULTS #
############
set -gx EDITOR vim
set -gx LANG en_GB.UTF-8
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig /usr/share/pkgconfig $PKG_CONFIG_PATH

#############
# BASE DIRS #
#############

# export HOMEBREW_CELLAR="$LINUXBREW_DIR/Cellar"
# export HOMEBREW_PREFIX="$LINUXBREW_DIR"
# export HOMEBREW_REPOSITORY="$LINUXBREW_DIR/Homebrew"
# export NVM_DIR="$HOME/.config/nvm"
# export NVM_HOMEBREW="$LINUXBREW_DIR/opt/nvm"

set -gx XDG_CONFIG_HOME "$HOME/.config"

set -gx AWS_CONFIG_FILE "$XDG_CONFIG_HOME/aws/config"
set -gx AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME/aws/credentials"

set -gx GIT_SOURCE_HOME "$HOME/Code"
