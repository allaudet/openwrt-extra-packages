#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-flask-assets
PKG_VERSION:=0.12
PKG_RELEASE:=1

PKG_SOURCE:=Flask-Assets-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/86/ff/6000451570745d7a90847f6528d96d6b24c800eaaf9f26cf398accd8cee5/
PKG_MD5SUM:=b97b2f2f23517973ac551bde968d7b7e

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-Assets-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-assets
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Asset management for Flask
  URL:=https://pypi.python.org/pypi/Flask-Assets
  DEPENDS:=+python3 +python3-flask +python3-webassets
endef

define Package/python3-flask-assets/description
  Asset management for Flask, to compress and merge CSS and Javascript files.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-flask-assets/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-flask-assets))
