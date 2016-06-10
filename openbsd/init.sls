include:
  - openbsd.services
  - openbsd.interfaces
  - openbsd.pf

{% if pillar['openbsd']['gateway'] is string %}
openbsd_gateway:
  file.managed:
    - name: /etc/mygate
    - mode: 444
    - user: root
    - group: wheel
    - contents: {{ pillar['openbsd']['gateway'] }}
{% endif %}

/etc/profile:
  file.append:
    - name: /root/.profile
    - text: |
        export PKG_PATH="{{ pillar['openbsd']['pkg_mirror_uri'] }}/{{ grains['osrelease'] }}/packages/{{ grains['cpuarch'] }}/"
        export ENV="$HOME/.kshrc"
    - template: jinja

/root/.kshrc:
  file.managed:
    - contents: |
        . /etc/ksh.kshrc
        HISTFILE="${HOME}/.ksh_history"
        HISTSIZE="50000"
