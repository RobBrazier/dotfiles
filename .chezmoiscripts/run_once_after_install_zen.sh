#!/usr/bin/env bash

echo "Installing Zen Browser to /opt/zen"
wget -qO- https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-specific.tar.bz2 | sudo tar xjf - -C /opt
