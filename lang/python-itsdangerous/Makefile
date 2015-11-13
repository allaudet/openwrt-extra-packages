#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-itsdangerous
PKG_VERSION:=0.24
PKG_RELEASE:=1

PKG_SOURCE:=itsdangerous-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/i/itsdangerous/
PKG_MD5SUM:=a3d55aa79369aef5345c036a8a26307f

PKG_BUILD_DIR:=$(BUILD_DIR)/itsdangerous-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-itsdangerous
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Various helpers to pass trusted data to untrusted environments and back.
	URL:=https://pypi.python.org/pypi/itsdangerous/
	DEPENDS:=+python
endef

define Package/python-itsdangerous/description
  Various helpers to pass trusted data to untrusted environments and back.
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

define PyPackage/python-itsdangerous/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-itsdangerous))
$(eval $(call BuildPackage,python-itsdangerous))

