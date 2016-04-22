#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl8188eu-wext
PKG_VERSION:=v4.1.4_6773.20130222
PKG_RELEASE:=2

PKG_REV:=master
PKG_MD5SUM:=1c058a3e0fb0c98fa81c991a32cc4a43

PKG_SOURCE:=$(PKG_REV).zip
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtl8188eu-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8188eu-wext
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8188EU (WEXT)
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  URL:=https://github.com/lwfinger/rtl8188eu
  DEPENDS:=+@DRIVER_11N_SUPPORT @USB_SUPPORT +@DRIVER_WEXT_SUPPORT \
    +kmod-usb-core +r8188eu-firmware +hostapd-rtl871xdrv
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8188eu.ko
endef

define KernelPackage/rtl8188eu-wext/description
  Realtek 8188EU wireless drivers from the lwfinger repository.
  This driver (v4.1.4_6773.20130222) works with WEXT.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

define KernelPackage/rtl8188eu-wext/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8188eu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8188eu
endef

$(eval $(call KernelPackage,rtl8188eu-wext))
