#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-rpi.gpio
PKG_VERSION:=0.6.1
PKG_RELEASE:=1

PKG_SOURCE:=RPi.GPIO-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/R/RPi.GPIO/
PKG_MD5SUM:=254d0443a436eb241367c487274e7197

PKG_BUILD_DIR:=$(BUILD_DIR)/RPi.GPIO-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-rpi.gpio
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=A module to control Raspberry Pi GPIO channels.
	URL:=https://pypi.python.org/pypi/RPi.GPIO/
	DEPENDS:=+python
endef

define Package/python-rpi.gpio/description
  A module to control Raspberry Pi GPIO channels.
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

define PyPackage/python-rpi.gpio/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-rpi.gpio))
$(eval $(call BuildPackage,python-rpi.gpio))

