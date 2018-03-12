#
# Copyright (C) 2014-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-gunicorn
PKG_VERSION:=19.7.1
PKG_RELEASE:=1

PKG_SOURCE:=gunicorn-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/30/3a/10bb213cede0cc4d13ac2263316c872a64bf4c819000c8ccd801f1d5f822/
PKG_MD5SUM:=174d3c3cd670a5be0404d84c484e590c

PKG_BUILD_DIR:=$(BUILD_DIR)/gunicorn-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-gunicorn
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=WSGI HTTP Server for UNIX
  URL:=https://pypi.python.org/pypi/gunicorn
  DEPENDS:=+python3
endef

define Package/python3-gunicorn/description
  WSGI HTTP Server for UNIX
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-gunicorn/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-gunicorn))
