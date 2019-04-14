#!/bin/bash

cd "$(dirname "$0")" || exit 1

selected_symbol="$(./charpickerprint.sh)"

if [ $? -ne 0 ]; then
    exit 1
fi

xdotool type --delay 100 "$selected_symbol"
