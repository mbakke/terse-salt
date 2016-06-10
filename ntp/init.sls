{% from "ntp/map.jinja" import ntp with context %}

{% if grains['kernel'] == 'Linux' %}
ntp_service:
  service:
    - {{ ntp.service_state }}
    - name: {{ ntp.service_name }}
    - enable: {{ ntp.service_enable }}
    - watch:
      - file: ntp_conf
{% endif %}

ntp_conf:
  file.managed:
    - name: {{ ntp.config_file }}
    - source: {{ ntp.config_source }}
    - mode: 444
    - template: jinja
