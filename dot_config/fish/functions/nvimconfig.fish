function nvimconfig
    set config_dir $HOME/.config/nvim
    nvim $config_dir --cmd "cd $config_dir"
    chezmoi forget --force $config_dir || true
    chezmoi add -r $config_dir
    for file in $config_dir/*
        chezmoi add -r --exact $file
    end
    chezmoi forget --force $config_dir/lazy-lock.json || true
end
