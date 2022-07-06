if test -e ~/.profile
  fenv source ~/.profile
end

set -gx EDITOR vim
set -gx LANG en_GB.UTF-8
set -gx PYTHONDONTWRITEBYTECODE 1
set PATH $HOME/bin $HOME/.local/bin $PATH

#fish_add_path --path $HOME/bin
#fish_add_path --path $HOME/.local/bin

set -gx XDG_CONFIG_HOME "$HOME/.config"

set -gx GIT_SOURCE_HOME "$HOME/Code"

set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib64 /usr/lib64
set -gx PKG_CONFIG_PATH PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig /usr/share/pkgconfig
