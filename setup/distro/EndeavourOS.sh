#!/usr/bin/env bash

bash $(dirname -- "${BASH_SOURCE[0]}")/ArchLinux.sh

yay -Syu mullvad-vpn-bin librewolf-bin 
