if type -q mise
    mise activate fish | source
    mise completion fish | source

    set PATH $GOPATH/bin $PATH
end
