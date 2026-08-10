# System defaults
# None

system="host"
if [[ "$CONTAINER_ID" != "" ]]; then
	system=$(. /etc/os-release && echo "$ID")
fi

zshrc="$HOME/.config/zsh/.zshrc.$system"
if [[ -e $zshrc ]]; then
	source $zshrc
else
    # Sane defaults
    zstyle ':omz:update' mode disabled
    export ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="sunaku-zapling"
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
fi
