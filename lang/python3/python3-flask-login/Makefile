#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-flask-login
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=Flask-Login-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/70/96/20cae731ef27084dcb183f3a6e3073d0232f10c1fd7be76729bd7bd4b994/
PKG_MD5SUM:=e050efaa2c4dbc2d97f480a70f4d44aa

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-Login-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-login
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=User session management for Flask
  URL:=https://pypi.python.org/pypi/Flask-Login
  DEPENDS:=+python3 +python3-flask
endef

define Package/python3-flask-login/description
  User session management for Flask.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-flask-login/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-flask-login))
