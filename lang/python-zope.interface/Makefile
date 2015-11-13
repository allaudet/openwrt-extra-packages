#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-zope.interface
PKG_VERSION:=4.1.3
PKG_RELEASE:=1

PKG_SOURCE:=zope.interface-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/z/zope.interface/
PKG_MD5SUM:=9ae3d24c0c7415deb249dd1a132f0f79

PKG_BUILD_DIR:=$(BUILD_DIR)/zope.interface-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-zope.interface
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Interfaces for Python.
	URL:=https://pypi.python.org/pypi/zope.interface/
	DEPENDS:=+python
endef

define Package/python-zope.interface/description
  Interfaces for Python.
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

define PyPackage/python-zope.interface/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-zope.interface))
$(eval $(call BuildPackage,python-zope.interface))

