include $(TOPDIR)/rules.mk

PKG_NAME:=python-cffi
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=cffi-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/c/cffi/
PKG_MD5SUM:=faca1e420e80433db409bb1bdd0a3f45

PKG_BUILD_DIR:=$(BUILD_DIR)/cffi-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-cffi
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Foreign Function Interface for Python calling C code
	URL:=https://pypi.python.org/pypi/cffi
	DEPENDS:=+python +python-pycparser
endef

define Package/python-cffi/description
  Foreign Function Interface for Python calling C code.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define PyPackage/python-cffi/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-cffi))
$(eval $(call BuildPackage,python-cffi))
