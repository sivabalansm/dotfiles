#! /bin/bash

timestamp=$(date '+%Y-%m-%e-%H%M%S')

# name of content
image_name="OCR_shot_${timestamp}.png"
txt_name="${image_name%.png}.txt"

# path of content
img_path="/tmp/$image_name"
txt_path="/tmp/$txt_name"

# take the screenshot
scrot -s -o "$img_path"

[ "$?" -eq 0 ] && { 

	tesseract "$img_path" "${txt_path%.txt}" 2>/dev/null
	xclip -sel clipboard "$txt_path"

	dunstify "OCR copied to clipboard" "$(cat "$txt_path")"
}
