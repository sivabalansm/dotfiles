#! /bin/bash

timestamp=$(date '+%Y-%m-%d-%H%M%S')
default_name="screenshot_${timestamp}.png"
path="/tmp/$default_name"

# take the screenshot
scrot -s -o $path 

if [ "$?" -eq 0 ]
then
	dunstify -I "$path" "Screenshot" "$default_name"

	# Name it
	new_name=$(printf "" | dmenu -p "Rename '${default_name%.png}'")
	
	# "t" stands for temp, so nothing is saved to disk, simply a copy of screenshot
	if [ "$new_name" = "t" ];
	then
		xclip -selection clipboard -target image/png "$path"
		dunstify -I "$path" "Screenshot Only Copied" "Screenshot only copied to clipboard"
	else
		# check if name is greater than zero lenght and give it proper extension else keep default name
		[ -n "$new_name" ] && new_name="${new_name%.png}.png" || new_name="$default_name"
		
		# store in proper location
		mv $path "$HOME/pic/sshot/$new_name"
	
		# copy image to clipboard
		xclip -selection clipboard -target image/png "$HOME/pic/sshot/$new_name"
	fi
fi
