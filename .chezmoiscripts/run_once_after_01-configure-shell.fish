#!/usr/bin/env fish

echo "Running install-packages.fish"

if ! test -f $HOME/.config/fish/functions/fisher.fish
  set fisher_install $(mktemp -d)
  curl -sL https://git.io/fisher -o "$fisher_install/fisher.fish"
  source $fisher_install/fisher.fish
  fisher update
else
  echo "Fisher already installed"
end

if ! grep -c /etc/shells $(which fish)
  echo "$(which fish)" | sudo tee -a /etc/shells
end

if [ "$SHELL" != "$(which fish)" ]
  echo "Changing default shell to $(which fish)"
  chsh -s $(which fish)
end

chezmoi completion fish --output=~/.config/fish/completions/chezmoi.fish

if ! test -f $HOME/.ssh/id_ed25519
  echo "Generating id_ed25519"
  ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -N ''
else
  echo "id_ed25519 already generated"
end

if ! test -f $HOME/.ssh/git_ed25519
  echo "Generating git_ed25519"
  ssh-keygen -t ed25519 -f $HOME/.ssh/git_ed25519 -N ''
else
  echo "git_ed25519 already generated"
end

