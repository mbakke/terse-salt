{% from "nginx/map.jinja" import nginx with context %}

include:
  - nginx.conf

nginx_package:
  pkg.installed:
    - name: {{ nginx.package_name }}

nginx_service:
   service:
     - {{ nginx.service_state }}
     - name: {{ nginx.service_name }}
     - enable: {{ nginx.service_enable }}
     - watch:
       - file: nginx_config

nginx_config:
  file.managed:
     - name: {{ nginx.config_file }}
     - mode: {{ nginx.config_mode }}
     - user: {{ nginx.config_user }}
     - group: {{ nginx.config_group }}
     - source: {{ nginx.config_source }}
     - template: {{ nginx.config_template }}
     - check_cmd: nginx -t -c
     - context:
       config_data:
         {{ salt['pillar.get']('nginx:config', {}) }}
