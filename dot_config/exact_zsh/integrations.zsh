local command_exists() {
    type "$1" > /dev/null 2>&1
}

local mise_exists() {
	mise which "$1" &>/dev/null
}

if command_exists 'mise'; then
	eval "$(mise activate zsh)"
fi

if mise_exists 'sheldon'; then
	eval "$(mise x -- sheldon source)"
	smartcache comp sheldon completions --shell zsh
fi

if command_exists 'atuin'; then
	smartcache eval atuin init zsh
fi

if command_exists 'usage'; then
	smartcache comp mise completion zsh
fi

if command_exists 'chezmoi'; then
	smartcache comp chezmoi completion zsh
fi


if command_exists 'wezterm'; then
	smartcache comp wezterm shell-completion --shell zsh
fi

if command_exists 'rbw'; then
	if ! pgrep rbw-agent &>/dev/null; then
		echo "Starting rbw-agent"
		rbw unlock
	fi
fi

if command_exists 'crush'; then
	smartcache comp crush completion zsh
fi

if command_exists 'bat'; then
	if [ ! -d "$HOME/.cache/bat" ]; then
		bat cache --build
	fi
fi
