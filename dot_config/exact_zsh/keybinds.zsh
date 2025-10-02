bindkey -e

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^b' backward-word
bindkey '^f' forward-word
