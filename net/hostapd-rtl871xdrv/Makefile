#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hostapd-rtl871xdrv
PKG_VERSION:=1.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/hostapd-rtl871xdrv
  SECTION:=system
  CATEGORY:=Network
  MAINTAINER:=Adrià Llaudet <allaudet@nakima.es>
  TITLE:=rtl871xdrv drivers for hostapd
  DEPENDS:=hostapd
endef

define Package/hostapd-rtl871xdrv/description
  rtl871xdrv drivers for hostapd.
endef

define Build/Compile
	true
endef

define Package/hostapd-rtl871xdrv/install
	$(INSTALL_DIR)  $(1)/lib/netifd/wireless
	$(INSTALL_BIN)  ./files/lib-netifd-wireless-rtl871xdrv.sh \
						$(1)/lib/netifd/wireless/rtl871xdrv.sh

	#$(INSTALL_DIR)  $(1)/lib/wifi
	#$(INSTALL_BIN)  ./files/lib-wifi-rtl871xdrv.sh  $(1)/lib/wifi/rtl871xdrv.sh

endef

$(eval $(call BuildPackage,hostapd-rtl871xdrv))
