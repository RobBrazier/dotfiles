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
if command_exists 'direnv'; then
	eval "$(direnv hook zsh)"
fi

if mise which bob &>/dev/null; then
	eval "$(mise x -- bob complete zsh)"
	export PATH="$HOME/.local/share/bob/nvim-bin/:$PATH"
fi
