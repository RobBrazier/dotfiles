function nvimconfig
    set config_dir $HOME/.config/nvim
    nvim $config_dir --cmd "cd $config_dir" $argv
    echo "Cleaning nvim files"
    find "$(chezmoi source-path $config_dir)" -maxdepth 1 -mindepth 1 | xargs rm -r
    echo "Updating files in chezmoi"
    find "$config_dir" -maxdepth 1 -mindepth 1 -not -name lazy-lock.json | xargs chezmoi add -r --exact
end
