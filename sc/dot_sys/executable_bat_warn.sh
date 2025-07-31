#! /bin/bash

[ $1 ] || { echo -e "battery_warning requires 1 argument and none were supplied\nUsage: battery_warning [frequency]\nfrequency: Seconds will be multiplied by 60 so it's in minutes" ; exit 1; }
frequencey=$(($1*60))
while :
do
	if [ "$(cat /sys/class/power_supply/BAT0/status)" = "Discharging" ]
	then
		battery_status=$(cat /sys/class/power_supply/BAT0/capacity)
		[ $battery_status -le 20 ] && [ $battery_status -gt 10 ] && notify-send -u critical "Battery low" "Plug charger"
		[ $battery_status -le 10 ] && notify-send -u critical "Battery critically low" "Plug charger immediately or save files and shutdown"
	fi
	sleep $frequencey
done
