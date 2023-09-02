#!/bin/bash

BATTERY_ICON="🔋"
CHARGING_ICON="⚡️"
battery_info=$(acpi -b | awk -F'[,:%]' '{print $2, $3}' | sed 's/ //g')
battery_status=$(echo $battery_info | awk '{print $1}')
battery_percentage=$(echo $battery_info | awk '{print $2}')

if [[ "$battery_status" == "Charging" ]]; then
    echo "$CHARGING_ICON$battery_percentage%"
else
    echo "$BATTERY_ICON$battery_percentage%"
fi

