#!/bin/sh
#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
#
. /lib/netifd/netifd-wireless.sh
. /lib/netifd/hostapd.sh

init_wireless_driver "$@"


drv_rtl871xdrv_cleanup() {
    echo "rtl871xdrv: Cleaning up" > /dev/kmsg
    #killall hostapd >/dev/null 2>&1
    #killall wpa_supplicant >/dev/null 2>&1

    #ifconfig wlan0 0.0.0.0 2>/dev/null

    sleep 1
}

drv_rtl871xdrv_init_device_config() {
    #echo "rtl871xdrv: drv_rtl871xdrv_init_device_config" > /dev/kmsg
    hostapd_common_add_device_config

    # path = platform/bcm2708_usb/usb1/1-1/1-1.4:1.0/
    config_add_string path
    config_add_string hwmode
}

drv_rtl871xdrv_init_iface_config() {
    #echo "rtl871xdrv: drv_rtl871xdrv_init_iface_config" > /dev/kmsg
    hostapd_common_add_bss_config
}


########################################################################
########################################################################

drv_rtl871xdrv_setup() {
    #echo "rtl871xdrv: drv_rtl871xdrv_setup" > /dev/kmsg
    json_select config
    json_get_vars path hwmode
    json_select ..

    # 1) GET WLAN
    wlan=
    if [ -n "$path" -a -d /sys/devices/"$path" ]; then
        if [ -d /sys/devices/"$path"/net ]; then
            wlan=$(ls /sys/devices/"$path"/net)
        else
            #rtl871xdrv
            echo "rtl871xdrv: ERROR - PATH for device '$1' has no interfaces enabled" > /dev/kmsg
            wireless_set_retry 0
            return 1
        fi
    else
        echo "rtl871xdrv: ERROR - Could not find PATH for device '$1'" > /dev/kmsg
        wireless_set_retry 0
        return 1
    fi

    #echo "            > path: '$path'" > /dev/kmsg
    #echo "            > wlan: '$wlan'" > /dev/kmsg

    hostapd_conf_file="/var/run/hostapd-$wlan.conf"
    #echo "            > hostapd_conf_file: '$hostapd_conf_file'" > /dev/kmsg

    # 2) Loop over interfaces
    # 2.1) Check if AP
    has_ap=
    hostapd_ctrl=
    for_each_interface "ap" rtl871xdrv_check_ap

    #echo "            > has_ap: '$has_ap'" > /dev/kmsg

    rm -f "$hostapd_conf_file"

    if [ -n "$has_ap" ]; then
        # Create the base config for hostapd
        rtl871xdrv_hostapd_setup_base
    fi

    # 2.2) Prepare STA interfaces
    for_each_interface "sta adhoc mesh monitor" rtl871xdrv_prepare_vif
    # 2.3) Prepare AP interfaces
    for_each_interface "ap" rtl871xdrv_prepare_vif

    # 2.4) Start hostapd if any interface is ready
    if [ -n "$hostapd_ctrl" ]; then
        /usr/sbin/hostapd -P /var/run/hostapd-"$wlan".pid -B "$hostapd_conf_file"
        ret="$?"
        wireless_add_process "$(cat /var/run/wifi-"$wlan".pid)" "/usr/sbin/hostapd" 1
        [ "$ret" != 0 ] && {
            wireless_setup_failed HOSTAPD_START_FAILED
            return
        }
    fi

    # 2.5) Enable each interface
    for_each_interface "ap sta adhoc mesh monitor" rtl871xdrv_setup_vif

    wireless_set_up

    #echo "            > Wireless setted up" > /dev/kmsg
    echo "rtl871xdrv: $wlan: device setted up" > /dev/kmsg
}

rtl871xdrv_check_ap() {
    #echo "rtl871xdrv: rtl871xdrv_check_ap" > /dev/kmsg
    has_ap=1
}

rtl871xdrv_hostapd_setup_base() {
    #echo "rtl871xdrv: rtl871xdrv_hostapd_setup_base" > /dev/kmsg
    local chwmode="g"

    if [ "$hwmode" = "11n" ]; then
        chwmode="g"
    fi
    #echo "            > chwmode: '$chwmode'" > /dev/kmsg

    cat > "$hostapd_conf_file" <<EOF
driver=rtl871xdrv
ieee80211n=1
hw_mode=$chwmode
device_name=RTL8188EU
manufacturer=Realtek

auth_algs=1
ignore_broadcast_ssid=0
macaddr_acl=0

channel=$channel

EOF
}

rtl871xdrv_prepare_vif() {
    #echo "rtl871xdrv: rtl871xdrv_prepare_vif" > /dev/kmsg
    local ifname

    json_select config

    json_get_vars mode ssid key macaddr

    json_select ..

    ifname="$wlan"

    if [ -z "$macaddr" ]; then
        # GET MAC ADDR
        if [ -f /sys/devices/"$path"/net/"$wlan"/address ]; then
            macaddr="$(head -n 1 /sys/devices/"$path"/net/"$wlan"/address | tail -n1)"
        fi
    fi

    #echo "            > macaddr: '$macaddr'" > /dev/kmsg
    #echo "            > ifname: '$ifname'" > /dev/kmsg

    json_select config

    case "$mode" in
        ap)
            # TODO: HOSTAPD
            rtl871xdrv_hostapd_setup_bss "$ifname"
            [ -n "$hostapd_ctrl" ] || {
                hostapd_ctrl="${hostapd_ctrl:-/var/run/hostapd/$ifname}"
            }
            #echo "            > hostapd_ctrl: '$hostapd_ctrl'" > /dev/kmsg
        ;;
        sta)
            # TODO: WPA_SUPPLICANT
        ;;
        adhoc)
            # TODO: ADHOC
        ;;
        mesh)
            # TODO: MESH
        ;;
        monitor)
            # TODO: MONITOR
        ;;
    esac

    json_select ..

}

rtl871xdrv_hostapd_setup_bss() {
    #echo "rtl871xdrv: rtl871xdrv_hostapd_setup_bss" > /dev/kmsg
    local cwlan="$1"

    cat >> "$hostapd_conf_file" <<EOF
interface=$cwlan
ssid=$ssid
wpa=2
wpa_passphrase=$key
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP

beacon_int=100
wpa_group_rekey=86400
ht_capab=[SHORT-GI-20][SHORT-GI-40]
max_num_sta=8

rts_threshold=2347
fragm_threshold=2346

wmm_enabled=1

wmm_ac_be_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmax=10
wmm_ac_be_cwmin=4
wmm_ac_be_txop_limit=0

wmm_ac_bk_acm=0
wmm_ac_bk_aifs=7
wmm_ac_bk_cwmax=10
wmm_ac_bk_cwmin=4
wmm_ac_bk_txop_limit=0

wmm_ac_vi_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmax=4
wmm_ac_vi_cwmin=3
wmm_ac_vi_txop_limit=94

wmm_ac_vo_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_cwmin=2
wmm_ac_vo_txop_limit=47
EOF
}

rtl871xdrv_setup_vif() {
    #echo "rtl871xdrv: rtl871xdrv_setup_vif" > /dev/kmsg
    local name="$1"
    local failed

    ifname="$wlan"

    json_select config

    case "$mode" in
        sta)
            rtl871xdrv_setup_supplicant || failed=1
        ;;
    esac

    json_select ..
    [ -n "$failed" ] || wireless_add_vif "$name" "$ifname"
}

rtl871xdrv_setup_supplicant() {
    #echo "rtl871xdrv: rtl871xdrv_setup_supplicant" > /dev/kmsg
    wpa_supplicant_prepare_interface "$ifname" wext || return 1
    wpa_supplicant_add_network "$ifname"
    wpa_supplicant_run "$ifname" ${hostapd_ctrl:+-H $hostapd_ctrl}
}


########################################################################
########################################################################

drv_rtl871xdrv_teardown() {
    #echo "rtl871xdrv: drv_rtl871xdrv_teardown" > /dev/kmsg
    wireless_process_kill_all

    #echo "            > wlan: '$wlan'" > /dev/kmsg
    rtl871xdrv_interface_cleanup "$wlan"

}

rtl871xdrv_interface_cleanup() {
    #echo "rtl871xdrv: rtl871xdrv_interface_cleanup" > /dev/kmsg
    local cwlan="$1"
    #echo "            > cwlan: '$cwlan'" > /dev/kmsg
    ifconfig "$cwlan" down
}

add_driver rtl871xdrv
