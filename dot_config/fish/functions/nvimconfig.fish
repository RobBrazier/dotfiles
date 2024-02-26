function nvimconfig
    set config_dir $HOME/.config/nvim
    nvim $config_dir --cmd "cd $config_dir"
    chezmoi add -r --exact $config_dir
end
