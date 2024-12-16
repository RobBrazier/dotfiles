#!/usr/bin/env bash

echo "Installing Zen Browser to /opt/zen"
if ! [ -d "/opt/zen" ]; then
	wget -qO- https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-specific.tar.bz2 | sudo tar xjf - -C /opt
else
	echo "Zen Browser is already installed - skipping."
fi

sudo ln -sf /opt/zen/zen /usr/local/bin/zen
