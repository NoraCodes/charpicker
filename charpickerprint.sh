#!/bin/bash
#
# Based on work by https://github.com/mbfraga
# This version modified by Leonora Tindall <nora@nora.codes>
# Released under the GNU GPL v3.0

theme="arthur-c.rasi"
character_list="special_character_list"
character_list_rofi="special_character_list.rofi"
character_list_chars="special_character_list.symbols"
user_theme=~/.config/charpicker/theme.rasi

if [ -f "$user_theme" ]; then
    theme="$user_theme"
fi

start_rofi () {
    rofi -dmenu -i -sync -theme "$theme" -p "sym:" -format d
}

compile () {
    ./compile.sh
}

cd "$(dirname "$0")" || exit 1

# compile rofi lines and character files if needed
if [ ! -f .compiled-sha1 ]; then
    compile
else
    if [ "$(sha1sum "$character_list")" != "$(cat .compiled-sha1)" ]; then
        compile
    fi
fi

# check if rofi is installed
if ! (command -v rofi &>/dev/null); then
    echo "rofi is not installed; aborting"
    exit 2
fi

# make the user select an entry
selected_row=$(start_rofi < "$character_list_rofi")

if [ $? -ne 0 ]; then
    exit 1
fi

# select the corresponding symbol
selected_symbol="$(sed -n ${selected_row}p "$character_list_chars")"

# trim trailing whitespaces
selected_symbol="${selected_symbol// }"

# print symbol
echo -n "$selected_symbol"
