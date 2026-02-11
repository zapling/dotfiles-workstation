# System defaults
# None

system="host"
if [[ "$CONTAINER_ID" != "" ]]; then
	system=$(. /etc/os-release && echo "$ID")
fi

zshrc="$HOME/dotfiles/zsh/.zshrc.$os_id"
if [[ -e $zshrc ]]; then
	source $zshrc
fi
