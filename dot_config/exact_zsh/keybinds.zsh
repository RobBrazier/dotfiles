# Keybindings
bindkey -e # emacs binds e.g. ctrl-left, ctrl-right

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Right]="${terminfo[kcuf1]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

function bind() {
	if [[ -n "$1" ]]; then
		bindkey -- "$1" "$2"
	fi
}

# History
bind '^p' history-search-backward
bind '^n' history-search-forward
bind "${key[PageUp]}" beginning-of-buffer-or-history
bind "${key[PageDown]}" end-of-buffer-or-history
bind "${key[Up]}" up-line-or-history
bind "${key[Down]}" down-line-or-history

# Navigation
bind "${key[Home]}" beginning-of-line
bind "${key[End]}" end-of-line
bind "${key[Control-Left]}" backward-word
bind "${key[Control-Right]}" forward-word
bind "${key[Left]}" backward-char
bind "${key[Right]}" forward-char

bind "${key[Insert]}" overwrite-mode
bind "${key[Delete]}" delete-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
# From https://wiki.archlinux.org/title/Zsh#Key_bindings
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
