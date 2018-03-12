#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-jinja2
PKG_VERSION:=2.9.5
PKG_RELEASE:=1

PKG_SOURCE:=Jinja2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/71/59/d7423bd5e7ddaf3a1ce299ab4490e9044e8dfd195420fc83a24de9e60726/
PKG_MD5SUM:=9e55f0db6620dd99a1b366183a94270d

PKG_BUILD_DIR:=$(BUILD_DIR)/Jinja2-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-jinja2
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=full featured template engine for Python
  URL:=https://pypi.python.org/pypi/Jinja2
  DEPENDS:=+python3 +python3-markupsafe
endef

define Package/python3-jinja2/description
  A small but fast and easy to use stand-alone template engine written in pure python.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-jinja2/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-jinja2))
