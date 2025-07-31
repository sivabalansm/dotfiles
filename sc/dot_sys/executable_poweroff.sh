#! /bin/bash

function confirm() {
	[ $(echo -e "Yes\nNo" | dmenu -i -p "Are you sure you want to $1") = "Yes" ]
}
answer=$(echo -e "Shutdown\nRestart\n" | dmenu -i -p "Power options")
[ $answer = "Shutdown" ] && confirm "shutdown" && shutdown now
[ $answer = "Restart" ] && confirm "restart" && shutdown -r now
