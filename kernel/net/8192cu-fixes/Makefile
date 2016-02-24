#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=8192cu-fixes
PKG_REV:=master
PKG_VERSION:=4.0.2_9000
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_REV).tar.gz
PKG_SOURCE_URL:=https://github.com/pvaret/rtl8192cu-fixes/archive/
PKG_MD5SUM:=7b2594e4d4f090a182f702034cb3a841

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtl8192cu-fixes-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/8192cu-fixes
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8192cu driver v4.0.2 Fixed
  MAINTAINER:=Adrià Llaudet <allaudet@nakima.es>
  URL:=https://github.com/pvaret/rtl8192cu-fixes
  DEPENDS:=+@DRIVER_11N_SUPPORT @USB_SUPPORT +@DRIVER_WEXT_SUPPORT +kmod-crypto-aead +kmod-usb-core +kmod-mac80211
  KCONFIG:=CONFIG_CFG80211=m \
    CONFIG_NL80211_TESTMODE=n CONFIG_CFG80211_REG_DEBUG=n \
    CONFIG_CFG80211_DEVELOPER_WARNINGS=n \
    CONFIG_CFG80211_DEFAULT_PS=n \
    CONFIG_CFG80211_DEBUGFS=y CONFIG_CFG80211_INTERNAL_REGDB=n \
    CONFIG_CFG80211_WEXT=y \
    CONFIG_ATH_COMMON=n CONFIG_IWM=n CONFIG_MWIFIEX=n \
    CONFIG_MAC80211=m \
    CONFIG_MAC80211_RC_PID=n CONFIG_MAC80211_RC_MINSTREL=y \
    CONFIG_MAC80211_RC_MINSTREL_HT=y \
    CONFIG_MAC80211_MESH=n CONFIG_MAC80211_LEDS=n \
    CONFIG_MAC80211_DEBUGFS=n CONFIG_MAC80211_DEBUG_MENU=n \
    CONFIG_MAC80211_HWSIM=n \
    CONFIG_RTL8192CU=n CONFIG_WL1251=n \
    CONFIG_WL12XX_MENU=n \
    CONFIG_RSI_91X=n
  FILES:= $(PKG_BUILD_DIR)/8192cu.ko
  AUTOLOAD:=$(call AutoLoad,50, 8192cu)
endef

define KernelPackage/8192cu-fixes/description
  This is a repackaging of Realtek's own 8192CU USB WiFi driver for Ubuntu 13.10 and later.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

$(eval $(call KernelPackage,8192cu-fixes))
