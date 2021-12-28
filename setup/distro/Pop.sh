#!/usr/bin/env bash

sudo apt update
sudo apt install fish stow git curl build-essential apt-transport-https file vim pwgen htop kitty locate -y

# for PHP
sudo apt install re2c libpq-dev libreadline-dev -y
