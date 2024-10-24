# env var exports
export EDITOR="nvim"
export LANG="en_GB.UTF-8"


if mise which gh &>/dev/null && mise exec github-cli@latest -- gh auth status &>/dev/null; then
	# mise
	export GITHUB_API_TOKEN="$(mise exec github-cli@latest -- gh auth token)"
	# chezmoi
	export CHEZMOI_GITHUB_ACCESS_TOKEN="$GITHUB_API_TOKEN"
	# bin
	export GITHUB_AUTH_TOKEN="$GITHUB_API_TOKEN"
fi
