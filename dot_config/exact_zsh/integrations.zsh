local command_exists() {
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

if command_exists 'wezterm'; then
	eval "$(wezterm shell-completion --shell zsh 2>/dev/null)"
fi

if mise which direnv &>/dev/null; then
	eval "$(mise x -- direnv hook zsh)"
elif command_exists 'direnv'; then
	eval "$(direnv hook zsh)"
fi

if mise which zoxide &>/dev/null; then
	eval "$(mise x -- zoxide init zsh)"
fi

if mise which rbw &>/dev/null; then
	if ! $(mise x -- rbw unlocked); then
		mise x -- rbw unlock &
	fi
fi
