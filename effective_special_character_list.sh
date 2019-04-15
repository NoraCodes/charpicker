#!/bin/bash

user_character_list=/dev/null
user_character_list_path=~/.config/charpicker/special_character_list

if [ -f "$user_character_list_path" ]; then
    user_character_list="$user_character_list_path"
fi

cat special_character_list "$user_character_list"
