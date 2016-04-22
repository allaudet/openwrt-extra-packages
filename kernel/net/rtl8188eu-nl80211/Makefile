#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl8188eu-nl80211
PKG_VERSION:=4.1.8_9499
PKG_RELEASE:=1

PKG_REV:=4.1.8_9499
PKG_BRANCH:=v4.1.8_9499
PKG_MD5SUM:=2b3d884a0c9f62e42f5570a99c5aa557

PKG_SOURCE:=$(PKG_BRANCH).zip
PKG_SOURCE_URL:=https://github.com/lwfinger/rtl8188eu/archive/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/rtl8188eu-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8188eu-nl80211
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek 8188EU (nl80211)
  MAINTAINER:=Adria Llaudet <allaudet@nakima.es>
  URL:=https://github.com/lwfinger/rtl8188eu
  DEPENDS:=@USB_SUPPORT +r8188eu-firmware +kmod-usb-core \
    +kmod-mac80211 #+kmod-mac80211-kernel
  KCONFIG:=
  FILES:= $(PKG_BUILD_DIR)/8188eu.ko
endef

define KernelPackage/rtl8188eu-nl80211/description
  Realtek 8188EU wireless drivers from the lwfinger repository.
  This driver (v4.1.8_9499) works with the nl80211 API.
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
	KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)
endef

define KernelPackage/rtl8188eu-nl80211/install
	$(INSTALL_DIR) $(1)/etc/modules.d/
	echo "8188eu rtw_power_mgnt=0 rtw_enusbss=0" > $(1)/etc/modules.d/50-8188eu
endef

$(eval $(call KernelPackage,rtl8188eu-nl80211))
