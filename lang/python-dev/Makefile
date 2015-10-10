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
	#
	# Libraries
	#
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) \
		$(BUILD_DIR)/Python-$(PKG_VERSION)/ipkg-install/usr/include/python$(PYTHON_VERSION) \
		$(1)/usr/include/
	#
	# Host Python modules (only *.py)
	#
	# TODO : Now solved on python package itself
endef

$(eval $(call BuildPackage,python-dev))

