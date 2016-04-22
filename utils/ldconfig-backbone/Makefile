#
# Copyright (C) 2012-2015 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=ldconfig-backbone
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/ldconfig-backbone
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=ldconfig Backbone Configuration Folders
  DEPENDS:=ldconfig
endef

define Package/ldconfig-backbone/description
  Creates the folder backbone and configuration files that ldconfig needs.
endef

define Build/Compile
	true
endef

define Package/ldconfig-backbone/install
	$(INSTALL_DIR) $(1)/etc
	echo "include /etc/ld.so.conf.d/*.conf" > $(1)/etc/ld.so.conf
endef

$(eval $(call BuildPackage,ldconfig-backbone))
