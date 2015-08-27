include $(TOPDIR)/rules.mk

PKG_NAME:=RPi.GPIO
PKG_VERSION:=0.5.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/R/RPi.GPIO/
PKG_MD5SUM:=9dc3dab6ce2b7ccb833a866efb392821

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-rpi-gpio
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Module to control RPi GPIO channels
	URL:=https://pypi.python.org/pypi/RPi.GPIO
	DEPENDS:=+python +python-dev
endef

define Package/python-rpi-gpio/description
  This package provides a class to control the GPIO on a Raspberry Pi.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --prefix="$(PKG_INSTALL_DIR)/usr" \
	)
endef

$(eval $(call PyPackage,python-rpi-gpio))
$(eval $(call BuildPackage,python-rpi-gpio))
