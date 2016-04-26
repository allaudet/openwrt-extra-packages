#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-requests
PKG_VERSION:=2.8.1
PKG_RELEASE:=1

PKG_SOURCE:=requests-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/r/requests/
PKG_MD5SUM:=a27ea3d72d7822906ddce5e252d6add9

PKG_BUILD_DIR:=$(BUILD_DIR)/requests-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-requests
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Python HTTP for Humans.
	URL:=https://pypi.python.org/pypi/requests/
	DEPENDS:=+python
endef

define Package/python-requests/description
  Requests is an Apache2 Licensed HTTP library, written in Python, for human beings.
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

define PyPackage/python-requests/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-requests))
$(eval $(call BuildPackage,python-requests))
