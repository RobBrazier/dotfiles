#!/usr/bin/env bash

distro=$(lsb_release -is)
hostname=$(uname -n)

echo "Running as $hostname on $distro"

if [[ -f "./setup/distro/$distro.sh" ]]; then
    echo "Running $distro specific install"
    bash "./setup/distro/$distro.sh"
fi

if [[ -f "./setup/machine/$hostname.sh" ]]; then
    echo "Running $hostname specific install"
    bash "./setup/machine/$hostname.sh"
fi

if [[ "$SHELL" -ne "/usr/bin/fish" ]]; then
  echo "Changing default shell to /usr/bin/fish"
  chsh -s /usr/bin/fish
fi

if [[ ! -h $HOME/.profile ]]; then
  mv $HOME/.profile $HOME/.profile.bak
fi
bash ./stow.sh

source ./shell/.profile

if [ ! -d $HOME/.local/share/omf ]; then
    temp_dir=$(mktemp -d)
    installer=$temp_dir/install
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > $installer
    fish $installer --path=~/.local/share/omf --config=~/.config/omf
else
    echo "Skipping Oh My Fish installation as already exists"
fi

# if [ ! -d $HOME/.zgenom ]; then
#     git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
# else
#     echo "Skipping zgenom installation as already exists"
# fi

if [ ! -d "$LINUXBREW_DIR" ]; then
    temp_dir=$(mktemp -d)
    linuxbrew_script=$temp_dir/install-brew.sh
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o $linuxbrew_script
    bash $linuxbrew_script
else
    echo "Skipping brew installation as already exists"
fi

# echo "> brew update"
# brew update
# echo "> brew upgrade"
# brew upgrade
# brew_install() {
#     local formulae=$(brew list --formulae)
#     local items=""
#     for item in $@; do
#         if [[ $formulae =~ (^|[[:space:]])"$item"($|[[:space:]]) ]]; then
#             echo "$item already exists"
#         else
#             local items="$items $item"
#         fi
#     done
#     if [ "${#items}" -gt 0 ]; then
#         echo "Running [brew install $items]"
#         brew install $items
#     else
#         echo "Skipping [brew install] as all packages already are installed"
#     fi
# }
# brew_install docker-compose jq python@3.9 the_silver_searcher pyenv awscli asdf

asdf plugin add poetry
asdf plugin add nodejs
asdf plugin add golang
asdf plugin add php
asdf plugin add python

asdf install poetry latest
asdf install nodejs lts-fermium
asdf install php latest
asdf install python latest
asdf install golang latest
# if [ ! -d $XDG_CONFIG_HOME/poetry ]; then
#     temp_dir=$(mktemp -d)
#     poetry_script=$temp_dir/install-poetry.py
#     curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py -o $poetry_script
#     POETRY_HOME="${XDG_CONFIG_HOME}/poetry" python $poetry_script
#     rm -rf $temp_dir
# else
#     echo "Skipping poetry installation as already exists"
# fi
