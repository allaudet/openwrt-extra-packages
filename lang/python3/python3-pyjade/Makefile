#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-pyjade
PKG_VERSION:=4.0.0
PKG_RELEASE:=1

PKG_SOURCE:=pyjade-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/4a/04/396ec24e806fd3af7ea5d0f3cb6c7bbd4d00f7064712e4dd48f24c02ca95/
PKG_MD5SUM:=c25c8433c0aed7d0e47de4e3f9bc8026

PKG_BUILD_DIR:=$(BUILD_DIR)/pyjade-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-pyjade
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=High performance port of Jade-lang for python
  URL:=https://pypi.python.org/pypi/pyjade
  DEPENDS:=+python3 +python3-six
endef

define Package/python3-pyjade/description
  Jade syntax template adapter for Django, Jinja2, Mako and Tornado templates.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-pyjade/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-pyjade))
