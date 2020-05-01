#!/usr/bin/env bash

sudo apt update
sudo apt install zsh stow git curl build-essential apt-transport-https file vim pwgen htop -y

if [[ "$SHELL" -ne "/usr/bin/zsh" ]]; then
  echo "Changing default shell to /usr/bin/zsh"
  chsh -s /usr/bin/zsh
fi

if [[ ! -h $HOME/.profile ]]; then
  mv $HOME/.profile $HOME/.profile.bak
fi
bash ./stow.sh

source ./zsh/.profile

if [ ! -d $HOME/.zgenom ]; then
    git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
else
    echo "Skipping zgenom installation as already exists"
fi

if [ ! -d "$LINUXBREW_DIR" ]; then
    temp_dir=$(mktemp -d)
    linuxbrew_script=$temp_dir/install-brew.sh
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o $linuxbrew_script
    bash $linuxbrew_script
else
    echo "Skipping brew installation as already exists"
fi

brew update
brew upgrade
brew_install() {
    local formulae=$(brew list --formulae)
    local items=""
    for item in $@; do
        if [[ $formulae =~ (^|[[:space:]])"$item"($|[[:space:]]) ]]; then
            echo "$item already exists"
        else
            local items="$items $item"
        fi
    done
    if [ "${#items}" -gt 0 ]; then
        echo "Running [brew install $items]"
        brew install $items
    else
        echo "Skipping [brew install] as all packages already are installed"
    fi
}
brew_install docker-compose jq nvm python@3.9 the_silver_searcher go pyenv awscli asdf

if [ ! -d $XDG_CONFIG_HOME/poetry ]; then
    temp_dir=$(mktemp -d)
    poetry_script=$temp_dir/get-poetry.py
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -o $poetry_script
    POETRY_HOME="${XDG_CONFIG_HOME}/poetry" python $poetry_script --no-modify-path
    rm -r $temp_dir
else
    echo "Skipping poetry installation as already exists"
fi
