#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-flask
PKG_VERSION:=0.12
PKG_RELEASE:=1

PKG_SOURCE:=Flask-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/4b/3a/4c20183df155dd2e39168e35d53a388efb384a512ca6c73001d8292c094a/
PKG_MD5SUM:=c1d30f51cff4a38f9454b23328a15c5a

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python microframework
  URL:=https://pypi.python.org/pypi/Flask
  DEPENDS:=+python3 +python3-werkzeug +python3-click +python3-jinja2 +python3-itsdangerous
endef

define Package/python3-flask/description
  A microframework based on Werkzeug, Jinja2 and good intentions.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-flask/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-flask))
