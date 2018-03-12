#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-flask-breadcrumbs
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=Flask-Breadcrumbs-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/39/60/4c18ddaca9c056acc2f9b62e396b04344af8c77dbbd32584b75bbdaba868/
PKG_MD5SUM:=59463d4cf4239185988d5ff206a5babf

PKG_BUILD_DIR:=$(BUILD_DIR)/Flask-Breadcrumbs-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python3 python3-setuptools python3-pytest-runner

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-flask-breadcrumbs
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Flask extension for breadcrumb navigation
  URL:=https://pypi.python.org/pypi/Flask-Breadcrumbs
  DEPENDS:=+python3 +python3-flask +python3-flask-menu +python3-six
endef

define Package/python3-flask-breadcrumbs/description
  Flask extension that adds support for generating site breadcrumb navigation.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-flask-breadcrumbs/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-flask-breadcrumbs))
