#!/usr/bin/env bash

firefox_base="$HOME/.config/firefox"
firefox_files=($(ls $firefox_base/*))

for profile in $(ls -d $HOME/.mozilla/firefox/*default*); do
	for file in ${firefox_files[@]}; do
		filename="$(basename $file)"
		echo "adding $filename to $profile"
		ln -sf $file "$profile/$filename"
	done
done
