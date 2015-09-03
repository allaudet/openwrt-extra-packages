# 
# Copyright (C) 2012-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=git-fix
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/git-fix
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  TITLE:= Git issue fix package
  DEPENDS:=git git-http
endef


define Package/git-fix/description
  Fix an issue of the Git install process where a soft-link is not created.
endef

define Build/Compile
	true
endef

define Package/git-fix/install
	$(INSTALL_DIR) $(1)/usr/lib/git-core
	tar zxvf ./files/files.tar.gz -C $(1)/usr/lib/git-core
endef

$(eval $(call BuildPackage,git-fix))
