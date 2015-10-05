#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libffi-dev
PKG_VERSION:=3.0.13
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libffi-dev-$(PKG_VERSION)

define Package/libffi-dev
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=FFI Development Libraries
  DEPENDS:=+libffi
endef

define Package/libffi-dev/description
  Foreign Function Interface (FFI) Development Libraries
endef

define Build/Compile
	true
endef

define Package/libffi-dev/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_BUILD_DIR)/../libffi-$(PKG_VERSION)/ipkg-install/usr/lib/libffi.{so,a,la} \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_BUILD_DIR)/../libffi-$(PKG_VERSION)/ipkg-install/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) \
		$(PKG_BUILD_DIR)/../libffi-$(PKG_VERSION)/ipkg-install/usr/lib/libffi-$(PKG_VERSION)/include/*.h \
		$(1)/usr/include/
endef

$(eval $(call BuildPackage,libffi-dev))

