## Patching hostapd

The default hostapd that openwrt has dont support the rtl871xdrv driver. To enable it, we have to patch hostapd:

```
#!console
cp ./800-hostapd_enable_driver_rtl871xdrv.patch ${OWRT_ROOT}/package/network/services/hostapd/patches/
```

And then we have to setup the configuration files to compile this new feature:

```
#!console
echo "CONFIG_DRIVER_RTW=y" >> ${OWRT_ROOT}/package/network/services/hostapd/files/hostapd-full.config
```
