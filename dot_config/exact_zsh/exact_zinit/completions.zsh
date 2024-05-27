# Load completions
autoload -U compinit && compinit -d "$STATE_HOME/zcompcache/.zcompdump"

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' cache-path "$STATE_HOME/zcompcache/"
