if type -q wezterm
    wezterm shell-completion --shell fish | tail -n +2 | source
end
