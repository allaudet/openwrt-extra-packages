#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-ifcfg
PKG_VERSION:=0.9.2
PKG_RELEASE:=1

PKG_SOURCE:=ifcfg-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/i/ifcfg/
PKG_MD5SUM:=73fbf4cbf0474c42a04231b373f6cbc7

PKG_BUILD_DIR:=$(BUILD_DIR)/ifcfg-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-ifcfg
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Python Ifconfig Wrapper for Unix/Linux/MacOSX.
	URL:=https://pypi.python.org/pypi/ifcfg/
	DEPENDS:=+python
endef

define Package/python-ifcfg/description
  Python Ifconfig Wrapper for Unix/Linux/MacOSX.
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

define PyPackage/python-ifcfg/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-ifcfg))
$(eval $(call BuildPackage,python-ifcfg))
