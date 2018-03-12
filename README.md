# Openwrt Extra Packages
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

### Language packages

### Python3

* python3-appdirs
* python3-can
* python3-click
* python3-flask
* python3-flask-assets
* python3-flask-breadcrumbs
* python3-flask-login
* python3-flask-menu
* python3-frozendict
* python3-gunicorn
* python3-itsdangerous
* python3-jinja2
* python3-markupsafe
* python3-packaging
* python3-pyjade
* python3-pyparsing
* python3-pytest-runner
* python3-setuptools_scm
* python3-six
* python3-webassets
* python3-werkzeug
