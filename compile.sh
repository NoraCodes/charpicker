#!/bin/bash
#
# See README.md for more details about the input format.

delim="$(printf '\t')"

remove_empty_lines () {
	sed '/^$/d'
}

cat special_character_list | remove_empty_lines | column -t -s "$delim" > special_character_list.rofi
cat special_character_list | remove_empty_lines | cut -d "$delim" -f 2 > special_character_list.symbols
sha1sum special_character_list > .compiled-sha1
