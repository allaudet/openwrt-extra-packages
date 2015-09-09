include $(TOPDIR)/rules.mk

PKG_NAME:=python-gpio
PKG_VERSION:=0.1.2
PKG_RELEASE:=1

PKG_SOURCE:=gpio-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/g/gpio/
PKG_MD5SUM:=78ec62e8f2611204d329b930ff5b8ec0

PKG_BUILD_DIR:=$(BUILD_DIR)/gpio-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-gpio
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=gpio access via the standard linux sysfs interface
	URL:=https://pypi.python.org/pypi/gpio
	DEPENDS:=+python
endef

define Package/python-gpio/description
  This library provides gpio access via the standard linux.
  It is intended to mimick [RPIO]http://pythonhosted.org/RPIO/ as much as possible
  for all features, while also supporting additional (and better named) functionality
  to the same methods.
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

define PyPackage/python-gpio/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-gpio))
$(eval $(call BuildPackage,python-gpio))
