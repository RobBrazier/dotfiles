set -gx EDITOR hx
set -gx LANG en_GB.UTF-8
set -gx PYTHONDONTWRITEBYTECODE 1
set PATH $HOME/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.local/share/npm/bin $PATH

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx GIT_SOURCE_HOME "$HOME/Code"

set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib64 /usr/lib64
set -gx PKG_CONFIG_PATH PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig /usr/share/pkgconfig

# Remove Fish Greeting
set fish_greeting

# Move Dotfiles
set -gx LESSHISTFILE "$XDG_CACHE_HOME/less/history"
# NodeJS
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
# Python
set -gx PYLINTHOME "$XDG_CACHE_HOME/pylint"
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -gx WORKON_HOME "$XDG_DATA_HOME/virtualenvs"
# Java
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
# Go
set -gx GOPATH "$XDG_DATA_HOME/go"
# AWS CLI
set -gx AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME/aws/credentials"
set -gx AWS_CONFIG_FILE "$XDG_CONFIG_HOME/aws/config"
# GnuPG
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"