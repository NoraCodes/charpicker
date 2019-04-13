#!/bin/bash
# Creates a menu of special characters with rofi which are pasted to the cursor via
# xdotool. Symbols can be added to the menu on the character_list with any keyword,
# using the syntax demonstrated below.
#
#     keyword   :symbol
#
# Anything between the colon and the \n (linebreak) will be pasted, excluding trailing
# whitespace, making multi-codepoint emoji and multi-glyph kaomoji
#
# Based on work by https://github.com/mbfraga
# This version modified by Leonora Tindall <nora@nora.codes>
# Released under the GNU GPL v3.0

theme="arthur-c.rasi"
character_list="special_character_list"
sep=":"

cd "$(dirname "$0")" || exit 1

if ! (command -v rofi 2>/dev/null); then
  echo "rofi not installed, abort"
  exit 2
fi

_rofi () {
      rofi -dmenu -i -sync -theme $theme -p "sym:"
}

selected_string=$(_rofi < "$character_list")

selected_symbol=$(cut -d "$sep" -f 2 <<< "$selected_string")
#trim whitespace
selected_symbol=${selected_symbol// }

echo "$selected_symbol"
xdotool type --delay 100 "$selected_symbol"

