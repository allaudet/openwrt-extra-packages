#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-picamera
PKG_VERSION:=1.10
PKG_RELEASE:=1

PKG_SOURCE:=picamera-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/p/picamera/
PKG_MD5SUM:=4529551551147aad49a2d7fb3f016a15

PKG_BUILD_DIR:=$(BUILD_DIR)/picamera-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-picamera
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Python interface for the Raspberry Pi camera module.
	URL:=https://pypi.python.org/pypi/picamera/
	DEPENDS:=+python
endef

define Package/python-picamera/description
  Python interface for the Raspberry Pi camera module.
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

define PyPackage/python-picamera/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-picamera))
$(eval $(call BuildPackage,python-picamera))
