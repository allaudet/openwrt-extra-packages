#
# Copyright (C) 2015-2016 Nakima.es
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=custom-kernel-config
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/custom-kernel-config
  SUBMENU:=Custom configurations
  TITLE:=Custom Kernel Configurations
  MAINTAINER:=Adrià Llaudet	<allaudet@nakima.es>
  KCONFIG:=CONFIG_ARCH_REQUIRE_GPIOLIB=y \
    CONFIG_BCM2708_GPIO=y \
    CONFIG_BCM2708_NOL2CACHE=y \
    CONFIG_BCM2708_VCMEM=y \
    CONFIG_GPIOLIB=y \
    CONFIG_GPIO_DEVRES=y \
    CONFIG_GPIO_SYSFS=y \
    CONFIG_LEDS_GPIO=y \
    CONFIG_OF_GPIO=y \
    CONFIG_DEBUG_GPIO=y \
    CONFIG_LZO_COMPRESS=y \
    CONFIG_LZO_DECOMPRESS=y \
    CONFIG_PWM=y \
    CONFIG_PWM_FSL_FTM=y \
    CONFIG_PWM_SYSFS=y \
    CONFIG_PWM_BCM2835=y \
    CONFIG_REGMAP=y \
    CONFIG_REGMAP_MMIO=y \
    CONFIG_GPIO_GENERIC=y \
    CONFIG_GPIO_GENERIC_PLATFORM=y

endef

define KernelPackage/custom-kernel-config/description
  Custom Kernel configurations to solve some GPIO and camera dependencies.
endef

define KernelPackage/custom-kernel-config/install
	true
endef

$(eval $(call KernelPackage,custom-kernel-config))
