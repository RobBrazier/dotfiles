#!/usr/bin/env fish

asdf plugin add nodejs
asdf plugin add python

asdf install nodejs lts-gallium
asdf install python latest

asdf global nodejs (asdf list nodejs | head -1 | xargs echo)
asdf global python (asdf list python | head -1 | xargs echo)
