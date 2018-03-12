#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-frozendict
PKG_VERSION:=1.2
PKG_RELEASE:=1

PKG_SOURCE:=frozendict-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/4e/55/a12ded2c426a4d2bee73f88304c9c08ebbdbadb82569ebdd6a0c007cfd08/
PKG_MD5SUM:=483ce6ddfe68ca197bc123aaafebf9ab

PKG_BUILD_DIR:=$(BUILD_DIR)/frozendict-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-frozendict
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=An immutable dictionary
  URL:=https://pypi.python.org/pypi/frozendict
  DEPENDS:=+python3
endef

define Package/python3-frozendict/description
  An immutable dictionary.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Package/python3-frozendict/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-frozendict))
