openbsd_services:
  file.managed:
    - name: /etc/rc.conf.local
    - source: salt://openbsd/rc.conf.local.j2
    - mode: 444
    - user: root
    - group: wheel
    - template: jinja
