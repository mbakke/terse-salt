include:
  - apt.config

apt_unattended_upgrades_package:
  pkg.installed:
    - name: unattended-upgrades
