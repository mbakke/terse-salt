{% from "unbound/map.jinja" import unbound with context %}

{% if unbound.package_manage %}
unbound_package:
  pkg.{{ unbound.package_state }}:
    - name: {{ unbound.package_name }}
    - require_in:
      - file: unbound_config
{% endif %}

{% if unbound.service_manage %}
unbound_service:
  service.{{ unbound.service_state }}:
    - name: {{ unbound.service_name }}
    - enable: {{ unbound.service_enable }}
    - watch:
      - file: unbound_config
{% endif %}

unbound_config:
  file.managed:
    - name: {{ unbound.config_file }}
    - mode: {{ unbound.config_mode }}
    - user: {{ unbound.config_user }}
    - group: {{ unbound.config_group }}
    - source: {{ unbound.config_source }}
    - template: {{ unbound.config_template }}
    # checkconf can't check files outside chroot on most platforms
    #- check_cmd: unbound-checkconf
    - defaults:
        pillar_path: {{ unbound.config_pillar_path }}
