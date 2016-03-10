#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl871x
PKG_VERSION:=v4.3.0.8_13968.20150417
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl871x
  SUBMENU:=Wireless Drivers
  TITLE:=TL-WN725N V2 (RTL871X)
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  URL:=http://www.tp-link.es/download/TL-WN725N.html#Driver
  DEPENDS:=@USB_SUPPORT +kmod-usb-core +kmod-cfg80211
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8188eu.ko
endef

define KernelPackage/rtl871x/description
  TP-LINK Drivers with 8188EUS support
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

define KernelPackage/rtl871x/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8188eu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8188eu
endef

$(eval $(call KernelPackage,rtl871x))
