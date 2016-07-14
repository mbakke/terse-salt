pf.conf:
  file.managed:
    - name: /etc/pf.conf
    - mode: 0400
    - user: root
    - group: wheel
    - source: salt://openbsd/pf.conf
    - check_cmd: /sbin/pfctl -nf
  cmd.wait:
    - name: /sbin/pfctl -f /etc/pf.conf
    - watch:
      - file: pf.conf 
