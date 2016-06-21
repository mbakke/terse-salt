salt_master_package:
  pkg.installed:
    - name: salt-master

salt_master_config:
  file.managed:
    - name: /etc/salt/master
    - mode: 444
    - user: root
    - group: root
    - source: salt://salt/config.jinja
    - template: jinja
    - context:
        pillar_key: master
