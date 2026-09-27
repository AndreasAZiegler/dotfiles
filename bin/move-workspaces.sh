#!/bin/bash

set -eo pipefail

current_workspace=$(swaymsg -t get_workspaces|jq -r '.[]|select(.focused) | .name')
current_output=$(swaymsg -t get_workspaces|jq -r '.[]|select(.focused) | .output')
current_ws_id=$(swaymsg -t get_workspaces|jq -r '.[]|select(.focused) | .id')
laptop=eDP-1

relocate_group() {
    local group=$1 output=$2 name
    while read -r name; do
        [[ "$name" == "${group}"* ]] || continue
        swaymsg workspace "$name" >/dev/null 2>&1 || true
        swaymsg "move workspace to output $output" >/dev/null 2>&1 || true
    done < <(swaymsg -t get_workspaces | jq -r '.[].name')
}

number_output() {
    local group=$1 output=$2 n=1 ws num
    while read -r num; do
        [[ -n "$num" ]] || continue
        swaymsg workspace number "$num" >/dev/null 2>&1 || true
        printf -v ws "%s%s" "$group" "$n"
        swaymsg rename workspace to "$ws" >/dev/null 2>&1 || true
        swaymsg "move workspace to output $output" >/dev/null 2>&1 || true
        n=$((n+1))
    done < <(swaymsg -t get_workspaces | jq -r --arg o "$output" '.[]|select(.output==$o)|.num' | sort -n)
}

activate_groups() {
    local entry group out
    for entry in "$@"; do
        group=${entry%%:*}
        out=${entry#*:}
        swaymsg focus output "$out" >/dev/null 2>&1 || true
        swaymsg workspace number "${group}1" >/dev/null 2>&1 || true
    done
    local target
    if [[ -n "$current_ws_id" ]]; then
        target=$(swaymsg -t get_workspaces | jq -r --arg id "$current_ws_id" '.[]|select(.id|tostring==$id)|.name' | head -n1)
        if [[ -n "$target" ]]; then
            swaymsg workspace "$target" >/dev/null 2>&1 || true
            return
        fi
    fi
    [[ -n "$current_output" ]] && swaymsg focus output "$current_output" >/dev/null 2>&1 || true
}

mapping=()
case $1 in
    work)
        screen=$(swaymsg -t get_outputs --pretty|grep 'Beihai Century Joint Innovation Technology Co.,Ltd M44-DFHD-120'|cut -d' ' -f2)
        mapping=("1:$screen" "2:$laptop")
        ;;
    staefa)
        left=$(swaymsg -t get_outputs --pretty|grep 'Samsung Electric Company U28E590 HTPK118955'|cut -d' ' -f2)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL P2423DE DWTL1L3'|cut -d' ' -f2)
        mapping=("1:$left" "2:$middle" "3:$laptop")
        ;;
    elm)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Acer Technologies Acer CB280HK T1HAA0014200'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'ASUSTek COMPUTER INC VG27A L3LMQS108121'|cut -d' ' -f2)
        mapping=("1:$middle" "2:$right" "3:$laptop")
        ;;
    lenzerheide)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Dell Inc. DELL ST2410 W189R04M0HFU'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001223F'|cut -d' ' -f2)
        mapping=("1:$middle" "2:$right" "3:$laptop")
        ;;
    tuebingen)
        middle=$(swaymsg -t get_outputs --pretty|grep 'LG Electronics LG HDR 4K 0x0001224A'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'Philips Consumer Electronics Company PHL 272B8Q UK01841003832'|cut -d' ' -f2)
        mapping=("1:$middle" "2:$right" "3:$laptop")
        ;;
    dufferin)
        middle=$(swaymsg -t get_outputs --pretty|grep 'Ancor Communications Inc ASUS PB278 E3LMTF122570'|cut -d' ' -f2)
        mapping=("1:$middle" "2:$laptop")
        ;;
    *)
        echo "usage $0 [work|staefa|elm|lenzerheide|tuebingen|dufferin]"
        ;;
esac

for entry in "${mapping[@]}"; do
    relocate_group "${entry%%:*}" "${entry#*:}"
done
for entry in "${mapping[@]}"; do
    number_output "${entry%%:*}" "${entry#*:}"
done
activate_groups "${mapping[@]}"

swaysome stop-daemon 2>/dev/null || true