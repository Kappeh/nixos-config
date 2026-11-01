#!/usr/bin/env bash

CONFIG="$1"

show_menu() {
    local menu_path="$1"

    while true; do
        entries=$(yq "${menu_path} | .[] | \"<span size='x-large'>\" + .icon + \"</span> \" + .text" "$CONFIG")

        if [[ -z $entries ]]; then
            return 0
        fi

        if ! selected_index=$(echo "$entries" | rofi -dmenu -markup-rows -i -no-custom -format i); then
            return 1
        fi

        item_path="${menu_path} | .[${selected_index}]"
        item_type=$(yq "${item_path} | .type" "$CONFIG")

        case "$item_type" in
            command)
                command=$(yq "${item_path} | .command" "$CONFIG")
                bash -c "$command"
                return 0
                ;;
            submenu)
                if show_menu "$item_path | .submenu"; then
                    return 0
                fi
                ;;
        esac
    done
}

show_menu "."

