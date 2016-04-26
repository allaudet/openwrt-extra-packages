#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-flask
PKG_VERSION:=0.10.1
PKG_RELEASE:=1

PKG_SOURCE:=Flask-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/F/Flask/
PKG_MD5SUM:=378670fe456957eb3c27ddaef60b2b24

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-flask
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A microframework based on Werkzeug and Jinja2
	URL:=https://pypi.python.org/pypi/Flask/
	DEPENDS:=+python +python-jinja2 +python-werkzeug +python-itsdangerous
endef

define Package/python-flask/description
  Flask is a microframework for Python based on Werkzeug, Jinja 2 and good
  intentions. And before you ask: It’s BSD licensed!.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define PyPackage/python-flask/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-flask))
$(eval $(call BuildPackage,python-flask))
