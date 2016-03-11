#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=8188eu-lwfinger-v4.1.8
PKG_REV:=v4.1.8_9499
PKG_VERSION:=4.1.8_9499
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_REV).zip
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu/archive/
PKG_MD5SUM:=2b3d884a0c9f62e42f5570a99c5aa557

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtl8188eu-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/8188eu-lwfinger-v4.1.8
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8188EU (lwfinger) v4.1.8
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  URL:=https://github.com/lwfinger/rtl8188eu
  DEPENDS:=@USB_SUPPORT +r8188eu-firmware +kmod-usb-core +kmod-kernel-wireless
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8188eu.ko
endef

define KernelPackage/8188eu-lwfinger-v4.1.8/description
  Updated lwfinger driver for Realtek 8192EU wireless devices.
  Driver v4.1.8_9499 works with nl80211.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

define KernelPackage/8188eu-lwfinger-v4.1.8/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8188eu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8188eu
endef

$(eval $(call KernelPackage,8188eu-lwfinger-v4.1.8))
