#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-appdirs
PKG_VERSION:=1.4.3
PKG_RELEASE:=1

PKG_SOURCE:=appdirs-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/
PKG_MD5SUM:=44c679904082a2133f5566c8a0d3ab42

PKG_BUILD_DIR:=$(BUILD_DIR)/appdirs-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-appdirs
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=appropriate platform-specific dirs
  URL:=https://pypi.python.org/pypi/appdirs/1.4.3
  DEPENDS:=+python3
endef

define Package/python3-appdirs/description
  A small Python module for determining appropriate platform-specific dirs,
  	e.g. a "user data dir".
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-appdirs/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-appdirs))
