# openwrt-extra-packages
OpenWrt extra feed packages

## Repository usage
1. Move into the openwrt folder

  ```bash
  cd /path/to/openwrt
  ```

2. Add this repository into the feed configuration file

  ```bash
  echo "src-git extra_packages https://github.com/zowler/openwrt-extra-packages.git" >> feeds.conf.default
  ```
3. Update and install the new feed packages

  ```bash
  ./scripts/feeds update -a
  ./scripts/feeds install -a
  ```

## Package List
### Language packages
* python-crypto
* python-dev
* python-numpy
* python-rpi-gpio

### Library packages
* opencv-3

### Utility packages
* byobu
* i2c-tools
