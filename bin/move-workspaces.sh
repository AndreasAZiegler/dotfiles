#!/bin/bash

set -eo pipefail

current_workspace=$(swaymsg -t get_workspaces|jq '.[]|select(.focused) | .name')
laptop=eDP-1

case $1 in
    work)
        screen=$(swaymsg -t get_outputs --pretty|grep 'Beihai Century Joint Innovation Technology Co.,Ltd M44-DFHD-120'|cut -d' ' -f2)
        for i in 1 2; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        for i in 3 4 5 6 7 8 9 10; do
            swaymsg workspace $i && swaymsg "move workspace to output $screen"; swaymsg workspace "$current_workspace"
        done
        ;;
    staefa)
        left=$(swaymsg -t get_outputs --pretty|grep 'Samsung Electric Company U28E590 HTPK118955'|cut -d' ' -f2)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL P2423DE DWTL1L3'|cut -d' ' -f2)

        for i in 4 3 2 1; do
            swaymsg workspace $i && swaymsg "move workspace to output $left"; swaymsg workspace "$current_workspace"
        done

        for i in 8 7 6 5; do
            swaymsg workspace $i && swaymsg "move workspace to output $middle"; swaymsg workspace "$current_workspace"
        done

        for i in 12 11 10 9; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        ;;
    lenzerheide)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL ST2410 W189R04M0HFU'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001223F'|cut -d' ' -f2)

        for i in 4 3 2 1; do
            swaymsg workspace $i && swaymsg "move workspace to output $middle"; swaymsg workspace "$current_workspace"
        done

        for i in 8 7 6 5; do
            swaymsg workspace $i && swaymsg "move workspace to output $right"; swaymsg workspace "$current_workspace"
        done

        for i in 12 11 10 9; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        ;;
    tuebingen)
        middle=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001224A'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'Philips Consumer Electronics Company PHL 272B8Q UK01841003832'|cut -d' ' -f2)

        for i in 4 3 2 1; do
            swaymsg workspace $i && swaymsg "move workspace to output $middle"; swaymsg workspace "$current_workspace"
        done

        for i in 8 7 6 5; do
            swaymsg workspace $i && swaymsg "move workspace to output $right"; swaymsg workspace "$current_workspace"
        done

        for i in 12 11 10 9; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        ;;
    *)
        echo "usage $0 [staefa|lenzerheide|tuebingen]"
esac

# swaymsg workspace 1 output "Samsung Electric Company U28E590 HTPK118955"
# workspace 2 output "Dell Inc. DELL P2423DE DWTL1L3"
# workspace 3 output eDP-1
