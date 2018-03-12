#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-flask-menu
PKG_VERSION:=0.5.1
PKG_RELEASE:=1

PKG_SOURCE:=Flask-Menu-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/f9/f3/1fa12a7fe6a851f624ab9a3cf7e7cb6d584eeee50b74dae395628d000944/
PKG_MD5SUM:=b59abcf41737361602a69241182fbaaf

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-Menu-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-menu
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Flask extension for generating menus
  URL:=https://pypi.python.org/pypi/Flask-Menu
  DEPENDS:=+python3 +python3-flask +python3-six
endef

define Package/python3-flask-menu/description
  Flask-Menu is a Flask extension that adds support for generating menus.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-flask-menu/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-flask-menu))
