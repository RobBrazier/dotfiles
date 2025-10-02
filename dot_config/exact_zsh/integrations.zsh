local command_exists() {
    type "$1" > /dev/null 2>&1
}

local mise_exists() {
	mise which "$1" &>/dev/null
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

if mise_exists 'sheldon'; then
	eval "$(mise x -- sheldon source)"
	eval "$(mise x -- sheldon completions --shell zsh)"
fi

if mise_exists 'direnv'; then
	eval "$(mise x -- direnv hook zsh)"
elif command_exists 'direnv'; then
	eval "$(direnv hook zsh)"
fi

if mise_exists 'zoxide'; then
	eval "$(mise x -- zoxide init zsh)"
fi

if mise_exists 'rbw'; then
	if ! pgrep rbw-agent &>/dev/null; then
		echo "Starting rbw-agent"
		mise x -- rbw unlock
	fi
fi

if mise_exists 'crush'; then
	eval "$(mise x -- crush completion zsh)"
fi
