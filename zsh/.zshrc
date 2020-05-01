DISABLE_AUTO_UPDATE=true
source "${HOME}/.zgenom/zgenom.zsh"

if ! zgenom saved; then
  # specify plugins here
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/sudo
  zgenom ohmyzsh plugins/common-aliases
  zgenom ohmyzsh plugins/command-not-found
  zgenom ohmyzsh plugins/nvm
  zgenom ohmyzsh plugins/pip
  zgenom ohmyzsh plugins/python
  zgenom ohmyzsh plugins/brew
  zgenom ohmyzsh plugins/extract

  zgenom ohmyzsh themes/robbyrussell

  zgenom load drgr33n/oh-my-zsh_aws2-plugin 
  zgenom load unixorn/autoupdate-zgen
  zgenom load MichaelAquilina/zsh-autoswitch-virtualenv
  zgenom load mdumitru/git-aliases
  zgenom load zsh-users/zsh-syntax-highlighting
  # generate the init script from plugins above
  zgenom save
fi

source $HOME/.profile

if ! type open > /dev/null; then
  alias open="open_command"
fi

export DOTFILES_DIR=$(dirname $(dirname $(readlink -f $HOME/.zshrc)))
export GIT_SOURCE_HOME=$HOME/Code
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH"

source $LINUXBREW_DIR/opt/asdf/libexec/asdf.sh

export stow_regenerate() {
  bash $DOTFILES_DIR/stow.sh
}

export dotfiles_update() {
  (
    cd $DOTFILES_DIR
    echo "Pulling changes from $(git config --get remote.origin.url) in $DOTFILES_DIR"
    git pull --recurse-submodules
  )
  stow_regenerate
}

export deployr() {
  if [ -n "$(whence -p deployr)" ]; then
    command deployr "$@"
  else
    (
      cd $HOME/.local/bin
      curl -Lo deployr https://github.com/skx/deployr/releases/download/release-0.10/deployr-linux-amd64
      chmod +x deployr
    )
  fi
}

export dokku() {
  ssh dokku@apps.robb.dev "$@"
}
