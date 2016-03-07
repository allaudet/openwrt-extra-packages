#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=8188eu-lwfinger-v4.1.4
PKG_REV:=master
PKG_VERSION:=v4.1.4_6773.20130222
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_REV).zip
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu/archive/
PKG_MD5SUM:=1c058a3e0fb0c98fa81c991a32cc4a43

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtl8188eu-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/8188eu-lwfinger-v4.1.4
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8188EU (lwfinger) v4.1.4
  MAINTAINER:=Adrià Llaudet <allaudet@nakima.es>
  URL:=https://github.com/lwfinger/rtl8188eu
  DEPENDS:=@USB_SUPPORT +@DRIVER_WEXT_SUPPORT +r8188eu-firmware +kmod-usb-core +kmod-mac80211 +hostapd-rtl871xdrv
  KCONFIG:=\
        CONFIG_STAGING=y \
        CONFIG_R8188EU \
        CONFIG_88EU_AP_MODE=y \
        CONFIG_88EU_P2P=n
  FILES:= $(PKG_BUILD_DIR)/8188eu.ko
  AUTOLOAD:=$(call AutoLoad,50, 8188eu)
endef

define KernelPackage/8188eu-lwfinger-v4.1.4/description
  Updated lwfinger driver for Realtek 8192EU wireless devices.
  Driver v4.1.4_6773.20130222 works with WEXT.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

$(eval $(call KernelPackage,8188eu-lwfinger-v4.1.4))
