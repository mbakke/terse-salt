salt_minion_package:
  pkg.installed:
    - name: salt-minion

salt_minion_config:
  file.managed:
    - name: /etc/salt/minion
    - mode: 444
    - user: root
    - group: root
    - source: salt://salt/config.jinja
    - template: jinja
    - context:
        pillar_key: minion
