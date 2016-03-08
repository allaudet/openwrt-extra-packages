include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=kernel-wireless
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/kernel-wireless
  SUBMENU:=Wireless Drivers
  TITLE:=Kernel Wireless
  FILES:= \
    $(LINUX_DIR)/net/wireless/cfg80211.ko \
    $(LINUX_DIR)/net/mac80211/mac80211.ko
  MAINTAINER:=Adrià Llaudet <allaudet@nakima.es>
  DEPENDS:=+@DRIVER_11N_SUPPORT
  KCONFIG:=CONFIG_CFG80211=m \
    CONFIG_NL80211_TESTMODE=n CONFIG_CFG80211_REG_DEBUG=n \
    CONFIG_CFG80211_DEVELOPER_WARNINGS=n \
    CONFIG_CFG80211_DEFAULT_PS=n \
    CONFIG_CFG80211_DEBUGFS=y CONFIG_CFG80211_INTERNAL_REGDB=n \
    CONFIG_CFG80211_WEXT=y \
    CONFIG_ATH_COMMON=n CONFIG_IWM=n CONFIG_MWIFIEX=n \
    CONFIG_MAC80211=m \
    CONFIG_MAC80211_RC_PID=n CONFIG_MAC80211_RC_MINSTREL=y \
    CONFIG_MAC80211_RC_MINSTREL_HT=y \
    CONFIG_MAC80211_MESH=n CONFIG_MAC80211_LEDS=n \
    CONFIG_MAC80211_DEBUGFS=n CONFIG_MAC80211_DEBUG_MENU=n \
    CONFIG_MAC80211_HWSIM=n \
    CONFIG_RTL8192CU=n CONFIG_WL1251=n \
    CONFIG_WL12XX_MENU=n
  AUTOLOAD:=$(call AutoLoad,20, cfg80211 mac80211)
endef

MAKE_OPTS:= \
        ARCH="$(LINUX_KARCH)" \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN" \
        KSRC=$(LINUX_DIR)

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

define KernelPackage/kernel-wireless/description
  This package includes a non 'compat-wireless' version
  of cfg80211.ko and mac80211.ko (i.e. the stock kernel version)
  so do not build with the openwrt
  kmod-cfg80211 or kmod-mac80211 packages built into the image
  (they'll still have to be compiled as modules though).
  Enabling kmod-mac80211 as a module is required to
  enable the nl80211 support in all the wireless tools.
endef

define KernelPackage/kernel-wireless/install
	$(INSTALL_DIR) $(1)/lib/wifi $(1)/lib/netifd/wireless
	$(INSTALL_DATA) \
		$(TOPDIR)/package/mac80211/files/lib/wifi/mac80211.sh \
		$(1)/lib/wifi/
	$(INSTALL_BIN) \
		$(TOPDIR)/package/mac80211/files/lib/netifd/wireless/mac80211.sh \
		$(1)/lib/netifd/wireless
endef

$(eval $(call KernelPackage,kernel-wireless))
