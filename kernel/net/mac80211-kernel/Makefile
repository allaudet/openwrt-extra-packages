#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mac80211-kernel
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/mac80211-kernel
  SUBMENU:=Wireless Drivers
  TITLE:=Kernel Wireless
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  DEPENDS:=+@DRIVER_11N_SUPPORT +@DRIVER_WEXT_SUPPORT \
    +kmod-rfkill +kmod-crypto-aead
  KCONFIG:=CONFIG_CFG80211=m \
    CONFIG_NL80211_TESTMODE=n CONFIG_CFG80211_REG_DEBUG=n \
    CONFIG_CFG80211_DEVELOPER_WARNINGS=n \
    CONFIG_CFG80211_DEFAULT_PS=n \
    CONFIG_CFG80211_DEBUGFS=y CONFIG_CFG80211_INTERNAL_REGDB=y \
    CONFIG_CFG80211_WEXT=y \
    CONFIG_ATH_COMMON=n CONFIG_IWM=n CONFIG_MWIFIEX=n \
    CONFIG_MAC80211=m \
    CONFIG_MAC80211_RC_PID=n CONFIG_MAC80211_RC_MINSTREL=y \
    CONFIG_MAC80211_RC_MINSTREL_HT=y \
    CONFIG_MAC80211_MESH=y CONFIG_MAC80211_LEDS=n \
    CONFIG_MAC80211_DEBUGFS=y CONFIG_MAC80211_DEBUG_MENU=n \
    CONFIG_MAC80211_HWSIM=n \
    CONFIG_RTL8192CU=n CONFIG_WL1251=n \
    CONFIG_WL12XX_MENU=n \
    CONFIG_RSI_91X=n
  FILES:= \
    $(LINUX_DIR)/net/wireless/cfg80211.ko \
    $(LINUX_DIR)/net/mac80211/mac80211.ko
  AUTOLOAD:=$(call AutoLoad,21, cfg80211 mac80211)
endef

define KernelPackage/mac80211-kernel/description
  This package compiles cfg80211 and mac80211 from the kernel sources instead of
  from the 'compat-wireless' ones.
  Enabling kmod-mac80211 as a module is required to enable the nl80211 support
  in all the wireless tools.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Prepare
	$(CP) ./files/regdb.txt $(LINUX_DIR)/net/wireless/db.txt
endef

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

define KernelPackage/mac80211-kernel/install
	$(INSTALL_DIR) $(1)/lib/wifi $(1)/lib/netifd/wireless
	$(INSTALL_BIN) \
		./files/netifd/mac80211.sh \
		$(1)/lib/netifd/wireless
	$(INSTALL_DATA) \
		./files/wifi/mac80211.sh \
		$(1)/lib/wifi/
endef

$(eval $(call KernelPackage,mac80211-kernel))
