# Add zsh plugins
zinit wait lucid light-mode for \
	atinit"zicompinit; zicdreplay" \
		zsh-users/zsh-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions \
	atinit"zicompinit; zicdreplay" \
		hlissner/zsh-autopair \
	atinit"zicompinit; zicdreplay" \
		Aloxaf/fzf-tab
