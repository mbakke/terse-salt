{% from "nginx/map.jinja" import nginx with context %}

nginx_configuration_directory:
  file.{{ nginx.conf_dir_state }}:
    - name: {{ nginx.conf_dir }}
    - user: {{ nginx.conf_dir_user }}
    - group: {{ nginx.conf_dir_group }}
    - dir_mode: {{ nginx.conf_dir_dir_mode }}
    - file_mode: {{ nginx.conf_dir_file_mode }}
    - recurse:
      - user
      - group
      - mode

{% for conf_name,data in salt['pillar.get']('nginx:conf', {}).iteritems(): %}
nginx_conf_{{ conf_name }}:
  file.managed:
    - name: {{ nginx.conf_dir }}/{{ conf_name }}.conf
    - source: salt://nginx/nginx.conf.j2
    - template: jinja 
    - context:
      config_data:
        {{ data | yaml_encode }}
{% endfor %}
