#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libopenssl-dev
PKG_VERSION:=1.0.2d
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libopenssl-dev-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/libopenssl-dev/Default/description
  OpenSSL Development Libraries.
endef

define Package/libopenssl-dev
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=SSL
  TITLE:=OpenSSL Development Libraries
  DEPENDS:=libopenssl
endef

define Build/Compile
	true
endef

define Package/libopenssl-dev/install
	$(INSTALL_DIR)  $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/../openssl-$(PKG_VERSION)/ipkg-install/usr/lib/lib{crypto,ssl}.{a,so} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/../openssl-$(PKG_VERSION)/ipkg-install/usr/include/openssl $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/../openssl-$(PKG_VERSION)/ipkg-install/usr/lib/pkgconfig/{openssl,libcrypto,libssl}.pc $(1)/usr/lib/pkgconfig/
	[ -n "$(TARGET_LDFLAGS)" ] && $(SED) 's#$(TARGET_LDFLAGS)##g' $(1)/usr/lib/pkgconfig/{openssl,libcrypto,libssl}.pc || true
endef

$(eval $(call BuildPackage,libopenssl-dev))

