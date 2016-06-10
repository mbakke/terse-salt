calamari-client:
  file.managed:
    - name: /etc/sudoers.d/ceph
    - template: jinja
    - source: salt://ceph/files/ceph.sudoers
    - mode: 444
