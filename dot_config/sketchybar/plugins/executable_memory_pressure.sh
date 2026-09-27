MEMORY_PRESSURE=$(memory_pressure | tail -n 1 | sed 's/[^0-9]*//g' | awk '{print 1 - $1/100}')
sketchybar --push "$NAME" "$MEMORY_PRESSURE"
