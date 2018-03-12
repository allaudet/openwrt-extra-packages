#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-werkzeug
PKG_VERSION:=0.12
PKG_RELEASE:=1

PKG_SOURCE:=Werkzeug-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/13/a2/c4f2a1e1e9239cd979de00a2d7e0008559c46d920e9842e9b8063c5e6bf5/
PKG_MD5SUM:=1fd20c9dceed7d4ac279d3770277315e

PKG_BUILD_DIR:=$(BUILD_DIR)/Werkzeug-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-werkzeug
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=The Swiss Army knife of Python web development
  URL:=https://pypi.python.org/pypi/Werkzeug
  DEPENDS:=+python3
endef

define Package/python3-werkzeug/description
  The Swiss Army knife of Python web development.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-werkzeug/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-werkzeug))
