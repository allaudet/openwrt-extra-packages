#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-dnspython
PKG_VERSION:=1.12.0
PKG_RELEASE:=1

PKG_SOURCE:=dnspython-$(PKG_VERSION).zip
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/d/dnspython/
PKG_MD5SUM:=bcfab8f4f4a2280f875e646502b23e66

PKG_BUILD_DIR:=$(BUILD_DIR)/dnspython-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-dnspython
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A DNS toolkit for Python.
	URL:=https://pypi.python.org/pypi/dnspython/
	DEPENDS:=+python
endef

define Package/python-dnspython/description
  A DNS toolkit for Python.
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

define PyPackage/python-dnspython/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-dnspython))
$(eval $(call BuildPackage,python-dnspython))

