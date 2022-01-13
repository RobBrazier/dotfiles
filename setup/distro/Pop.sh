#!/usr/bin/env bash

bash $(dirname -- "${BASH_SOURCE[0]}")/Ubuntu.sh

sudo apt install pwgen kitty -y

# for PHP
sudo apt install re2c libpq-dev libreadline-dev -y
