include $(TOPDIR)/rules.mk

PKG_NAME:=python-numpy
PKG_VERSION:=1.9.2
PKG_RELEASE:=1

PKG_SOURCE:=numpy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/n/numpy/
PKG_MD5SUM:=a1ed53432dbcd256398898d35bc8e645

PKG_BUILD_DIR:=$(BUILD_DIR)/numpy-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-numpy
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=NumPy
	URL:=https://pypi.python.org/pypi/numpy
	DEPENDS:=+python
endef

define Package/python-numpy/description
  NumPy is a general-purpose array-processing package designed to efficiently manipulate large multi-dimensional arrays of arbitrary records without sacrificing too much speed for small multi-dimensional arrays. NumPy is built on the Numeric code base and adds features introduced by numarray as well as an extended C-API and the ability to create arrays of arbitrary type which also makes NumPy suitable for interfacing with general-purpose data-base applications.
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

define PyPackage/python-numpy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call PyPackage,python-numpy))
$(eval $(call BuildPackage,python-numpy))
