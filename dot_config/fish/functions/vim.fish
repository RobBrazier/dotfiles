function vim --wraps=helix --description 'alias vim=hx'
    if command -q vim
        command vim $argv;
    else
        hx $argv;
    end
end
