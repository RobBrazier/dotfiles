#!/usr/bin/env bash

bash $(dirname -- "${BASH_SOURCE[0]}")/ArchLinux.sh

yay -Syu --noconfirm mullvad-vpn-bin librewolf-bin 
