#!/usr/bin/env fish

asdf plugin add nodejs
asdf plugin add python

asdf list all nodejs > /dev/null
asdf list all python > /dev/null

asdf install nodejs lts-gallium
#asdf install python latest

asdf global nodejs (asdf list nodejs | grep '*' | xargs echo | sed 's/*//g')
#asdf global python (asdf list python | grep '*' | xargs echo | sed 's/*//g')

#python -m pip install --user pipx
#python -m pipx ensurepath
