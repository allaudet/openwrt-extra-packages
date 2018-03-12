#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-itsdangerous
PKG_VERSION:=0.24
PKG_RELEASE:=1

PKG_SOURCE:=itsdangerous-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/
PKG_MD5SUM:=a3d55aa79369aef5345c036a8a26307f

PKG_BUILD_DIR:=$(BUILD_DIR)/itsdangerous-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-itsdangerous
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Helpers to pass trusted data to untrusted environments
  URL:=https://pypi.python.org/pypi/itsdangerous
  DEPENDS:=+python3
endef

define Package/python3-itsdangerous/description
  Various helpers to pass trusted data to untrusted environments and back.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-itsdangerous/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-itsdangerous))
