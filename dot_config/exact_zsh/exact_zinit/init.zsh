# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d $ZINIT_HOME ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

declare -A ZINIT
ZINIT[ZCOMPDUMP_PATH]="$STATE_HOME/zcompcache/.zcompdump"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
