function hx --wraps=helix --description 'alias hx=helix'
    if command -q hx
        command hx $argv;
    else
        helix $argv;
    end
end
