{% from "openntpd/map.jinja" import openntpd with context %}

{% if grains['kernel'] == 'Linux' %}
openntpd_service:
  service:
    - {{ openntpd.service_state }}
    - name: {{ openntpd.service_name }}
    - enable: {{ openntpd.service_enable }}
    - watch:
      - file: openntpd_config

openntpd_package:
  pkg.installed:
    - name: {{ openntpd.package_name }}
    - require_in:
      - file: openntpd_config
      - service: openntpd_service
{% endif %}

openntpd_config:
  file.managed:
    - name: {{ openntpd.config_file }}
    - source: {{ openntpd.config_source }}
    - mode: 444
    - template: jinja
