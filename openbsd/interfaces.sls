{% for if,conf in salt['pillar.get']('openbsd:interfaces', {}).iteritems() -%}
interface_{{ if }}:
  file.managed:
    - name: /etc/hostname.{{ if }}
    - mode: 440
    - user: root
    - group: wheel
    - contents: {{ conf }}
{% endfor %}
