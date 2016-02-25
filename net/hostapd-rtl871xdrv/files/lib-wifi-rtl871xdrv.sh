#!/bin/sh
#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
#
append DRIVERS "rtl871xdrv"

find_rtl871xdrv_phy() {
    echo "wifi -> rtl871xdrv: find_rtl871xdrv_phy" > /dev/kmsg
}

check_rtl871xdrv_device() {
    echo "wifi -> rtl871xdrv: check_rtl871xdrv_device" > /dev/kmsg
}

detect_rtl871xdrv() {
    # path = platform/bcm2708_usb/usb1/1-1/1-1.4:1.0/
    echo "wifi -> rtl871xdrv: detect_rtl871xdrv" > /dev/kmsg
    # Search phy location
    if [ -d /sys/module/r8188eu/drivers/usb\:r8188eu ]; then
        for phy_path in $(ls /sys/module/r8188eu/drivers/usb\:r8188eu | grep 1); do
            if [ -d /sys/module/r8188eu/drivers/usb\:r8188eu/${phy_path}/net ]; then
                wlans=$(ls /sys/module/r8188eu/drivers/usb\:r8188eu/${phy_path}/net)
            fi
        done
    fi

    mode_band="g"
    channel="11"

    cat <<EOF
config wifi-device  radio0
    option type      rtl871xdrv
    option channel   ${channel}
    option hwmode    11${mode_band}
    option path      ${path}
    option disabled  1

config wifi-iface
    option device      radio0
    option network     rtl_ap
    option mode        ap
    option ssid        OpenWrt
    option encryption  none
    option disabled    1

EOF
}
