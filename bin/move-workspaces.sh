#!/bin/bash

set -eo pipefail

current_workspace=$(swaymsg -t get_workspaces|jq -r '.[]|select(.focused) | .name')
laptop=eDP-1

move_group_to_output() {
    local group=$1
    local output=$2
    for n in 1 2 3 4 5; do
        local ws="${group}${n}"
        swaymsg workspace number "$ws" && swaymsg "move workspace to output $output"
        swaymsg workspace "$current_workspace"
    done
}

case $1 in
    work)
        screen=$(swaymsg -t get_outputs --pretty|grep 'Beihai Century Joint Innovation Technology Co.,Ltd M44-DFHD-120'|cut -d' ' -f2)
        move_group_to_output 1 "$screen"
        move_group_to_output 2 "$laptop"
        ;;
    staefa)
        left=$(swaymsg -t get_outputs --pretty|grep 'Samsung Electric Company U28E590 HTPK118955'|cut -d' ' -f2)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL P2423DE DWTL1L3'|cut -d' ' -f2)
        move_group_to_output 1 "$left"
        move_group_to_output 2 "$middle"
        move_group_to_output 3 "$laptop"
        ;;
    lenzerheide)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL ST2410 W189R04M0HFU'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001223F'|cut -d' ' -f2)
        move_group_to_output 1 "$middle"
        move_group_to_output 2 "$right"
        move_group_to_output 3 "$laptop"
        ;;
    tuebingen)
        middle=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001224A'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'Philips Consumer Electronics Company PHL 272B8Q UK01841003832'|cut -d' ' -f2)
        move_group_to_output 1 "$middle"
        move_group_to_output 2 "$right"
        move_group_to_output 3 "$laptop"
        ;;
    dufferin)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Ancor Communications Inc ASUS PB278 E3LMTF122570'|cut -d' ' -f2)
        move_group_to_output 1 "$middle"
        move_group_to_output 2 "$laptop"
        ;;
    *)
        echo "usage $0 [work|staefa|lenzerheide|tuebingen|dufferin]"
        ;;
esac

swaysome stop-daemon 2>/dev/null || true
