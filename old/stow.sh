#!/usr/bin/env bash
exclusions=(setup zsh shell vim librewolf asdf bin ssh git fish)
SCRIPT_DIR="$(cd `dirname $0` && pwd)"
enabled_config=""
for i in $(ls -d $SCRIPT_DIR/*/); do
    dir=${i%%/}
    dir=${dir/$SCRIPT_DIR\//}
    if [[ ${exclusions[*]} =~ (^|[[:space:]])"$dir"($|[[:space:]]) ]]; then
        echo "excluding $dir"
        continue
    fi
    enabled_config+=" $dir"
done

stow --dir=$SCRIPT_DIR --target=$HOME -vv $enabled_config
