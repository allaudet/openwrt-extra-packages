#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-jinja2
PKG_VERSION:=2.8
PKG_RELEASE:=1

PKG_SOURCE:=Jinja2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/J/Jinja2/
PKG_MD5SUM:=edb51693fe22c53cee5403775c71a99e

PKG_BUILD_DIR:=$(BUILD_DIR)/Jinja2-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-jinja2
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A Django inspired non-XML syntax
	URL:=https://pypi.python.org/pypi/Jinja2/
	DEPENDS:=+python +python-markupsafe
endef

define Package/python-jinja2/description
  Jinja2 is a template engine written in pure Python. It provides a Django
  inspired non-XML syntax but supports inline expressions and an optional
  sandboxed environment.
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

define PyPackage/python-jinja2/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-jinja2))
$(eval $(call BuildPackage,python-jinja2))
