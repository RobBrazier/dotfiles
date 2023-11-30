function ssh --description 'alias ssh=kitty +kitten ssh'
    if [ $TERM = xterm-kitty ]
        kitty +kitten ssh $argv
    else if [ $TERM_PROGRAM = WezTerm ]
        wezterm ssh $argv
    else
        command ssh $argv
    end
end
