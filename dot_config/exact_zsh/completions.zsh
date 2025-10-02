ZSH_COMP_CACHE="$ZSH_STATE_HOME/zcompcache"
autoload -U compinit && compinit -d "$ZSH_COMP_CACHE/.zcompdump"
# zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' cache-path "$ZSH_COMP_CACHE/"
