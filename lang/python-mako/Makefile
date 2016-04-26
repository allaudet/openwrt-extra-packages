#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-mako
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=Mako-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/M/Mako/
PKG_MD5SUM:=a78f20f6366a8a0659ce5532f8614e53

PKG_BUILD_DIR:=$(BUILD_DIR)/Mako-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-mako
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A super-fast templating language.
	URL:=https://pypi.python.org/pypi/Mako/
	DEPENDS:=+python +python-markupsafe
endef

define Package/python-mako/description
  A super-fast templating language that borrows the best ideas from the existing templating languages.
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

define PyPackage/python-mako/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-mako))
$(eval $(call BuildPackage,python-mako))
