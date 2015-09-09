include $(TOPDIR)/rules.mk

PKG_NAME:=python-pycparser
PKG_VERSION:=2.14
PKG_RELEASE:=1

PKG_SOURCE:=pycparser-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/p/pycparser/
PKG_MD5SUM:=a2bc8d28c923b4fe2b2c3b4b51a4f935

PKG_BUILD_DIR:=$(BUILD_DIR)/pycparser-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pycparser
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=C parser in Python
	URL:=https://pypi.python.org/pypi/pycparser
	DEPENDS:=+python
endef

define Package/python-pycparser/description
  pycparser is a complete parser of the C language, written in pure Python using the PLY parsing library. It parses C code into an AST and can serve as a front-end for C compilers or analysis tools.
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

define PyPackage/python-pycparser/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-pycparser))
$(eval $(call BuildPackage,python-pycparser))
