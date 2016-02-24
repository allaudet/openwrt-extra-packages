## Enable RPi Camera

To enable the camera, first add the following lines at `${OWRT_ROOT}/target/linux/brcm2708/image/Makefile` file.

```diff
        mcopy -i $(KDIR)/boot.img $(KDIR)/fixup.dat ::
        mcopy -i $(KDIR)/boot.img $(KDIR)/fixup_cd.dat ::
+       mcopy -i $(KDIR)/boot.img $(KDIR)/start_x.elf ::
+       mcopy -i $(KDIR)/boot.img $(KDIR)/fixup_x.dat ::
        mcopy -i $(KDIR)/boot.img cmdline.txt ::
        mcopy -i $(KDIR)/boot.img config.txt ::
```

Finally, add the following lines at the end of __*/boot/config.txt*__ (on the FAT32 partition):

```{r, engine='bash', count_lines}
gpu_mem=128
start_file=start_x.elf
fixup_file=fixup_x.dat
disable_camera_led=1
```

## Using I2C and SPI

Newer kernel versions in OpenWRT trunk feature a capability called "device tree support". This allows for automatic configuration of devices in /dev, but unfortunatly doesn't seem to work correctly.

Putting the following lines at the end of __*/boot/config.txt*__ (on the FAT32 partition) fixes this issue:

```{r, engine='bash', count_lines}
dtparam=i2c1=on (or dtparam=i2c0=on on old models)
dtparam=spi=on
dtparam=i2s=on
```

## Mapping path of __*/boot/config.txt*__

The file used to created the future __*/boot/config.txt*__ file is mapped at `${OWRT_ROOT}/target/linux/brcm2708/image/config.txt`
