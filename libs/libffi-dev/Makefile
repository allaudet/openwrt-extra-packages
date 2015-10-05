#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libffi-dev
PKG_VERSION:=1.0.2d
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/libffi-dev/Default/description
  OpenSSL Development Libraries.
endef

define Package/libffi-dev
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=OpenSSL Development Libraries
  DEPENDS:=+python
endef

define Build/Compile
	true
endef

define Package/libffi-dev/install
	false
endef

$(eval $(call BuildPackage,libffi-dev))

