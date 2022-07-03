#!/usr/bin/env fish

asdf plugin add nodejs
asdf plugin add python

asdf install nodejs lts-gallium
asdf install python latest

asdf global nodejs (asdf list nodejs | grep '*' | xargs echo | sed 's/*//g')
asdf global python (asdf list python | grep '*' | xargs echo | sed 's/*//g')
