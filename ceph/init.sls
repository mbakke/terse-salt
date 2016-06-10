ceph-common:
  pkg.installed: []
  file.managed:
    - name: /etc/ceph/ceph.conf
    - template: jinja
    - source: salt://ceph/files/ceph.conf.j2
    - mode: 444
