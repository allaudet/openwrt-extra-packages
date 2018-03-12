#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-packaging
PKG_VERSION:=16.8
PKG_RELEASE:=1

PKG_SOURCE:=packaging-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/
PKG_MD5SUM:=53895cdca04ecff80b54128e475b5d3b

PKG_BUILD_DIR:=$(BUILD_DIR)/packaging-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-packaging
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Core utilities for Python packages
  URL:=https://pypi.python.org/pypi/packaging
  DEPENDS:=+python3 +python3-pyparsing +python3-six
endef

define Package/python3-packaging/description
  Core utilities for Python packages.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-packaging/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-packaging))
