#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-setuptools_scm
PKG_VERSION:=1.15.0
PKG_RELEASE:=1

PKG_SOURCE:=setuptools_scm-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/80/b7/31b6ae5fcb188e37f7e31abe75f9be90490a5456a72860fa6e643f8a3cbc/
PKG_MD5SUM:=b6916c78ed6253d6602444fad4279c5b

PKG_BUILD_DIR:=$(BUILD_DIR)/setuptools_scm-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python3 python3-setuptools

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-setuptools_scm
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=manage your versions by scm tags
  URL:=https://pypi.python.org/pypi/setuptools_scm
  DEPENDS:=+python3 +python3-setuptools
endef

define Package/python3-setuptools_scm/description
  the blessed package to manage your versions by scm tags.
endef

define Build/Compile
	$(call Build/Compile/Py3Mod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)/
endef

define Package/python3-setuptools_scm/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-setuptools_scm))
