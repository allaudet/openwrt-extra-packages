include $(TOPDIR)/rules.mk

PKG_NAME:=python-dev
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PKG_SOURCE:=dev-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/d/dev/
PKG_MD5SUM:=00449cf0b347c32da9c840adcb4cf24b

PKG_BUILD_DIR:=$(BUILD_DIR)/dev-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-dev
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Libraries and tools for Python development
	URL:=https://pypi.python.org/pypi/dev/0.4.0
	DEPENDS:=+python
endef

define Package/python-dev/description
  Libraries and tools for Python development.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix="$(PKG_INSTALL_DIR)/usr" \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define PyPackage/python-dev/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* $(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-dev))
$(eval $(call BuildPackage,python-dev))
