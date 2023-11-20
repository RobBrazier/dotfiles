if type -q rtx
    rtx activate fish | source
    rtx completion fish | source

    set PATH $GOPATH/bin $PATH
end
