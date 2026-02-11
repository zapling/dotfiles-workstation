if [[ "$CONTAINER_ID" == "" ]]; then
	echo "You are on the HOST system."
	alias upgrade="sudo bootc upgrade"
	return
fi

os_id=$(. /etc/os-release && echo "$ID")
zshrc="$HOME/.zshrc.$os_id"
if [[ -e $zshrc ]]; then
	source $zshrc
fi
