#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-dev
PKG_VERSION:=2.7.9
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/Python-dev-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-dev
  SECTION:=language-python
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Libraries and tools for Python development
  DEPENDS:=python
endef

define Package/python-dev/description
  Libraries and tools for Python development.
endef

define Build/Compile
	true
endef

define Package/python-dev/install
	$(INSTALL_DIR) $(1)/usr/include/
	$(CP) \
		$(PKG_BUILD_DIR)/../Python-$(PKG_VERSION)/ipkg-install/usr/include/python$(PYTHON_VERSION) \
		$(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) \
		$(STAGING_DIR_HOST)/lib/python$(PYTHON_VERSION) \
		$(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) \
		$(STAGING_DIR_HOST)/lib/pkgconfig/python.pc \
		$(STAGING_DIR_HOST)/lib/pkgconfig/python2.pc \
		$(STAGING_DIR_HOST)/lib/pkgconfig/python-$(PYTHON_VERSION).pc \
		$(1)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(1)/usr/lib/python$(PYTHON_VERSION)/
	$(CP) \
		$(PKG_BUILD_DIR)/../Python-$(PKG_VERSION)/ipkg-install/usr/lib/python$(PYTHON_VERSION)/config \
		$(1)/usr/lib/python$(PYTHON_VERSION)/
endef

$(eval $(call BuildPackage,python-dev))

