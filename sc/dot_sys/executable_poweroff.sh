#! /bin/bash

function confirm() {
	[ $(echo -e "Yes\nNo" | dmenu -i -p "Are you sure you want to $1") = "Yes" ]
}

function has_app {
        local app=$1
        which "$app" 2>&1 > /dev/null
        if [ "$?" = "0" ];
        then
                return 0
        else
                return 1
        fi
}

if has_app "rofi"; then
        answer=$(echo -e "Shutdown\nRestart\n" | rofi -dmenu -i -p "Power options")
elif has_app "dmenu"; then
        answer=$(echo -e "Shutdown\nRestart\n" | dmenu -i -p "Power options")
else
        exit 1
fi

[ "$answer" = "Shutdown" ] && confirm "shutdown" && shutdown now
[ "$answer" = "Restart" ] && confirm "restart" && shutdown -r now
