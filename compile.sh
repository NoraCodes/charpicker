#!/bin/bash
#
# See README.md for more details about the input format.

delim="$(printf '\t')"

remove_empty_lines () {
	sed '/^$/d'
}

./effective_special_character_list.sh | remove_empty_lines | column -t -s "$delim" > special_character_list.rofi
./effective_special_character_list.sh | remove_empty_lines | cut -d "$delim" -f 2 > special_character_list.symbols
sha1sum < ./effective_special_character_list.sh > .compiled-sha1
