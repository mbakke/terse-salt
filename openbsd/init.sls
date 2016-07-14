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

openbsd_root_profile:
  file.blockreplace:
    - name: /root/.profile
    - marker_start: '### Start Salt managed section -- do not edit ###'
    - marker_end: '### End Salt managed section ###'
    - append_if_not_found: True
    - source: salt://openbsd/dotprofile.jinja
    - template: jinja

{% set kshrc = salt['pillar.get']('openbsd:dotkshrc') %}
{% if (kshrc is defined) and kshrc is string %}
/root/.kshrc:
  file.managed:
     - contents: |
{{ kshrc|indent(8,indentfirst=True) }}
{% endif %}
