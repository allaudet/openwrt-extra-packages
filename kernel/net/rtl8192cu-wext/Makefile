#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl8192cu-wext
PKG_VERSION:=4.0.2_9000
PKG_RELEASE:=1

PKG_REV:=master
PKG_MD5SUM:=7b2594e4d4f090a182f702034cb3a841

PKG_SOURCE:=$(PKG_REV).tar.gz
PKG_SOURCE_URL:=https://github.com/pvaret/rtlrtl8192cu-wext/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtlrtl8192cu-wext-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8192cu-wext
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8192CU (WEXT)
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  URL:=https://github.com/pvaret/rtlrtl8192cu-wext
  DEPENDS:=+@DRIVER_11N_SUPPORT @USB_SUPPORT +@DRIVER_WEXT_SUPPORT \
    +kmod-usb-core +rtl8192cu-firmware +hostapd-rtl871xdrv
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8192cu.ko
endef

define KernelPackage/rtl8192cu-wext/description
  Realtek 8192CU wireless drivers with some fixes.
  This driver (v4.0.2_9000) works with WEXT.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

define KernelPackage/rtl8192cu-wext/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8192cu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8192cu
endef

$(eval $(call KernelPackage,rtl8192cu-wext))
