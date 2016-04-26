#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-twisted
PKG_VERSION:=15.4.0
PKG_RELEASE:=1

PKG_SOURCE:=Twisted-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/T/Twisted/
PKG_MD5SUM:=5337ffb6aeeff3790981a2cd56db9655

PKG_BUILD_DIR:=$(BUILD_DIR)/Twisted-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-twisted
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=An asynchronous networking framework.
	URL:=https://pypi.python.org/pypi/Twisted/
	DEPENDS:=+python +python-zope.interface
endef

define Package/python-twisted/description
  An asynchronous networking framework written in Python.
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

define PyPackage/python-twisted/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-twisted))
$(eval $(call BuildPackage,python-twisted))
