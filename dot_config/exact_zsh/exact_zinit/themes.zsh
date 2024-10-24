if mise which oh-my-posh &>/dev/null; then
	posh="$(mise which oh-my-posh)"
	eval "$($posh init zsh --config $HOME/.config/ohmyposh/zen.yaml)"
fi
