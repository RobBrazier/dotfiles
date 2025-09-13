# env var exports
export EDITOR="nvim"
export LANG="en_GB.UTF-8"


if mise which gh &>/dev/null && mise x -- gh auth status &>/dev/null; then
	# mise
	export GITHUB_API_TOKEN="$(mise x -- gh auth token)"
	# chezmoi
	export CHEZMOI_GITHUB_ACCESS_TOKEN="$GITHUB_API_TOKEN"
	# bin
	export GITHUB_AUTH_TOKEN="$GITHUB_API_TOKEN"
	# mise
	export MISE_GITHUB_TOKEN="$GITHUB_API_TOKEN"
fi

if mise which rbw &>/dev/null; then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/rbw/ssh-agent-socket"
fi
