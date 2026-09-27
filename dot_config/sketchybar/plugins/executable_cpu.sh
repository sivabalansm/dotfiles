#!/bin/bash

# Get total CPU usage percentage on macOS
# CPU_INFO=$(ps -eo pcpu,user | tail -n +2 | awk '{sum+=$1} END {print sum/100}')
CPU_INFO=$(ps -A -o %cpu | awk '{s+=$1} END {print s/100}')

# Push the value to the sketchybar graph component
#sketchybar --set "$NAME" graph.update="$CPU_PERCENT"
sketchybar --push "$NAME" "$CPU_INFO"

