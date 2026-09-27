#!/bin/bash

# Get total CPU usage percentage on macOS
# CPU_INFO=$(ps -eo pcpu,user | tail -n +2 | awk '{sum+=$1} END {print sum/100}')
CPU_INFO=$(top -l 1 -s 0 -n 0 | grep "CPU usage" | awk '{gsub(/%/,"",$7); print 1 - $7/100}')

# Push the value to the sketchybar graph component
#sketchybar --set "$NAME" graph.update="$CPU_PERCENT"
sketchybar --push "$NAME" "$CPU_INFO"

