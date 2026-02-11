# System defaults
export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/firefox

system="host"
if [[ "$CONTAINER_ID" != "" ]]; then
	system=$(. /etc/os-release && echo "$ID")
fi

zshenv="$HOME/dotfiles/.config/zsh/.zshenv.$os_id"
if [[ -e $zshenv ]]; then
	source $zshenv
if
