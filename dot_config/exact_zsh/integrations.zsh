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

# Nix
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then 
	source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi
