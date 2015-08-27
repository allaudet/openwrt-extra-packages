#
# Copyright (C) 2009 Sharim At Work, Ltd.
# Author: Xiangfu Liu <xiangfu@sharism.cc>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=byobu
PKG_VERSION:=5.94

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:=http://launchpad.net/byobu/trunk/$(PKG_VERSION)/+download/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_MD5SUM:=e336071eded2343d1be74418bd7b4bc3
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/byobu
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Text-based window manager
    URL:=https://launchpad.net/byobu
    DEPENDS:=+tmux
endef

define Package/byobu/description
  Byobu is a Japanese term for decorative, multi-panel screens that serve
  as folding room dividers. As an open source project, Byobu is an elegant
  enhancement of the otherwise functional, plain, practical GNU Screen.
  Byobu includes an enhanced profile and configuration utilities for the
  GNU screen window manager, such as toggle-able system status notifications.
endef

define Package/byobu/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/lib/byobu \
		$(1)/usr/share

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(1)/usr/bin/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/byobu \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/byobu \
		$(1)/usr/share/
endef

$(eval $(call BuildPackage,byobu))

