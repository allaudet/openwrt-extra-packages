include $(TOPDIR)/rules.mk

PKG_NAME:=python-evdev
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PKG_SOURCE:=evdev-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/e/evdev/
PKG_MD5SUM:=03304ca01acc08a4ce07e1d739c4b59a

PKG_BUILD_DIR:=$(BUILD_DIR)/evdev-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-evdev
	SECTION:=language-python
	CATEGORY:=Languages
	SUBMENU:=Python
	TITLE:=Bindings to the Linux input handling subsystem
	URL:=https://pypi.python.org/pypi/evdev
	DEPENDS:=+python
endef

define Package/python-evdev/description
  This package provides bindings to the generic input event interface in Linux.
  The evdev interface serves the purpose of passing events generated in the
  kernel directly to userspace through character devices that are typically
  located in /dev/input/.
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

define PyPackage/python-evdev/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call PyPackage,python-evdev))
$(eval $(call BuildPackage,python-evdev))
