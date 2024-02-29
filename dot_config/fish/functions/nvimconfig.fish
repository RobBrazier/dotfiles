function nvimconfig
    set config_dir $HOME/.config/nvim
    nvim $config_dir --cmd "cd $config_dir"
    chezmoi forget --force $config_dir || true
    chezmoi add -r --exact $config_dir
end
