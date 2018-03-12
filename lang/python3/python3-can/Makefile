#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-can
PKG_VERSION:=2.0.0a2
PKG_RELEASE:=1

PKG_SOURCE:=python-can-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/ba/3e/12411021a47442719ec8a1d88f088c89fdf101684687d3441a1f19368e4b/
PKG_MD5SUM:=95797f00002978e606679e0290697f0f

PKG_BUILD_DIR:=$(BUILD_DIR)/python-can-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python3 python3-setuptools

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-can
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Controller Area Network interface module for Python
  URL:=https://pypi.python.org/pypi/python-can
  DEPENDS:=+python3
endef

define Package/python3-can/description
  Controller Area Network interface module for Python.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-can/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-can))
