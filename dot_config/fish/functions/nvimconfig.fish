function nvimconfig
    set config_dir $HOME/.config/nvim
    nvim $config_dir
    chezmoi add -r --exact $config_dir
end
