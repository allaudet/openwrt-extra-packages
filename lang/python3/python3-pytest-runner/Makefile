#
# Copyright (C) 2014-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-pytest-runner
PKG_VERSION:=2.11.1
PKG_RELEASE:=1

PKG_SOURCE:=pytest-runner-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/9e/4d/08889e5e27a9f5d6096b9ad257f4dea1faabb03c5ded8f665ead448f5d8a/
PKG_MD5SUM:=bdb73eb18eca2727944a2dcf963c5a81

PKG_BUILD_DIR:=$(BUILD_DIR)/pytest-runner-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=python3 python3-setuptools python3-setuptools_scm

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-pytest-runner
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=py.test as distutils command
  URL:=https://pypi.python.org/pypi/pytest-runner
  DEPENDS:=+python3
endef

define Package/python3-pytest-runner/description
  Invoke py.test as distutils command with dependency resolution.
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

define Package/python3-pytest-runner/install
	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(1)$(PYTHON3_PKG_DIR)
endef

$(eval $(call BuildPackage,python3-pytest-runner))
