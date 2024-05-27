command_exists() {
    type "$1" > /dev/null 2>&1
}

# Shell integrations
if command_exists 'chezmoi'; then
	eval "$(chezmoi completion zsh)"
fi
if command_exists 'mise'; then
	eval "$(mise activate zsh)"
	if command_exists 'usage'; then
		eval "$(mise completion zsh)"
	fi
fi
