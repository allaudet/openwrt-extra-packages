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
  DEPENDS:=+@DRIVER_11N_SUPPORT @USB_SUPPORT +@DRIVER_WEXT_SUPPORT +kmod-usb-core +kmod-kernel-wireless +hostapd-rtl871xdrv +rtl8192cu-firmware
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8192cu.ko
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

define KernelPackage/8192cu-fixes/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8192cu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8192cu
endef

$(eval $(call KernelPackage,8192cu-fixes))
