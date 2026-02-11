# System defaults
export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/firefox

export PATH=~/.local/bin:$PATH

# Override JQ colors so null values are red, works better than grey on dark background
export JQ_COLORS='0;31:0;39:0;39:0;39:0;32:1;39:1;39'

system="host"
if [[ "$CONTAINER_ID" != "" ]]; then
    system=$(. /etc/os-release && echo "$ID")
fi

zshenv="$HOME/.config/zsh/.zshenv.$system"
if [[ -e $zshenv ]]; then
    source $zshenv
fi
