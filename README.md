# openwrt-extra-packages
OpenWrt extra feed packages

## Repository usage
1. Move into the openwrt folder

  ```bash
  cd /path/to/openwrt
  ```
2. Add this repository into the feed configuration file

  ```bash
  echo "src-git extra_packages https://github.com/allaudet/openwrt-extra-packages.git" >> feeds.conf.default
  ```
3. Update and install the new feed packages

  ```bash
  ./scripts/feeds update -a
  ./scripts/feeds install -a
  ```

## Package List

### Kernel packages
* brcm2708-gpu-fw-custom

### Language packages
* python-dev

### Library packages
* opencv-3
* libopenssl-dev
* libffi-dev

### Network packages
* autossh
* git-fix

### Utility packages
* byobu
* i2c-tools
* ldconfig-backbone
