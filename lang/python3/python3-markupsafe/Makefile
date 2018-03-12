#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-markupsafe
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_SOURCE:=MarkupSafe-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/
PKG_MD5SUM:=2fcedc9284d50e577b5192e8e3578355

PKG_BUILD_DIR:=$(BUILD_DIR)/MarkupSafe-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-markupsafe
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=XML/HTML/XHTML Markup safe string for Python
  URL:=https://pypi.python.org/pypi/MarkupSafe
  DEPENDS:=+python3
endef

define Package/python3-markupsafe/description
  Implements a XML/HTML/XHTML Markup safe string for Python.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-markupsafe/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-markupsafe))
