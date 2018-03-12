#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-webassets
PKG_VERSION:=0.12.1
PKG_RELEASE:=1

PKG_SOURCE:=webassets-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/9a/35/d86c6d3bd31e2e9c8351c8766ef3688c75d56bc5233ed49061e522efc3cc/
PKG_MD5SUM:=429401824556e6e0868e437f9e561ba6

PKG_BUILD_DIR:=$(BUILD_DIR)/webassets-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-webassets
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Media asset management for Python
  URL:=https://pypi.python.org/pypi/webassets
  DEPENDS:=+python3
endef

define Package/python3-webassets/description
  Media asset management for Python, with glue code for various web frameworks.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-webassets/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-webassets))
