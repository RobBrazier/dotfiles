function ssh --description 'alias ssh=kitty +kitten ssh'
    if [ $TERM = xterm-kitty ]
        kitty +kitten ssh $argv
    else
        command ssh $argv
    end
end