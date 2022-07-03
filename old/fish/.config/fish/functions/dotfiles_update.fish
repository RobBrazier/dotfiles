function dotfiles_update
    pushd $DOTFILES_DIR
    echo "Pulling changes from (git config --get remote.origin.url) in $DOTFILES_DIR"
    git pull --recurse-submodules || true
    popd
    stow_regenerate
end