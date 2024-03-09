if type -q mise
    mise activate fish | source
    if type -q usage
        mise completion fish | source
    end
end
