#! /bin/bash

timestamp=$(date '+%Y-%m-%d-%H%M%S')
default_name="screenshot_${timestamp}.png"
path="/tmp/$default_name"

# take the screenshot
scrot -s -o $path 

if [ "$?" -eq 0 ]
then
	dunstify -I "$path" "Screenshot" "$default_name"

	# Copy or Name option
	option=$(printf "copy\nsave as" | dmenu -p "Save? ")
	
	# "t" stands for temp, so nothing is saved to disk, simply a copy of screenshot
	if [ "$option" = "save as" ];
	then
		new_name=$(printf "" | dmenu -p "Rename: ${default_name%.png}'")
		# check if name is greater than zero lenght and give it proper extension else keep default name
		[ -n "$new_name" ] && new_name="${new_name%.png}.png" || new_name="$default_name"
		
		# store in proper location
		cp $path "$HOME/pic/sshot/$new_name"
	
		# copy image to clipboard
		xclip -selection clipboard -target image/png "$HOME/pic/sshot/$new_name"
		dunstify -I "$path" "Screenshot Copied and Saved" "Screenshot saved as $HOME/pic/sshot/$new_name"
	else
		xclip -selection clipboard -target image/png "$path"
		dunstify -I "$path" "Screenshot Only Copied" "Screenshot only copied to clipboard"
	fi

fi
