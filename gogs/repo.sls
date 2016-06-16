{% if grains['os_family'] == 'Debian' %}
gogs_repository:
  pkgrepo.managed:
    - name: deb https://deb.packager.io/gh/pkgr/gogs {{ grains['oscodename'] }} pkgr
    - key_url: https://deb.packager.io/key
    - require_in: gogs_package
{% endif %}
