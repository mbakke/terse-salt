{% from "acmetool/map.jinja" import acmetool with context %}

include:
  - acmetool.config
{% if acmetool.manage_repo %}
  - acmetool.repo
{%- endif %}

{% if acmetool.install_from_package %}
acmetool_package:
  pkg.installed:
    - name: {{ acmetool.package_name }}
    - require_in:
      - cmd: acmetool_quickstart

{# else download binary here #}
{% endif %}

{% if acmetool.manage_user %}
acmetool_user:
  user.present:
    - name: {{ acmetool.user }}
    - gid: {{ acmetool.group }}
    - home: {{ acmetool.directory }}
    - createhome: False # managed below
    - system: True 
{% endif %}

{% if acmetool.manage_group %}
acmetool_group:
  group.present:
    - name: {{ acmetool.group }}
    - system: True
    - require_in:
      - user: acmetool_user
{% endif %}

acmetool_directory:
  file.directory:
    - name: {{ acmetool.directory }}
    - user: {{ acmetool.user }}
    - group: {{ acmetool.group }}
    - dir_mode: 755

acmetool_hooks_directory:
  file.directory:
    - name: {{ acmetool.hooks_directory }}
    - user: root
    - group: root
    - makedirs: True
    - dir_mode: '755'
    - file_mode: '4755'
    - recurse:
      - user
      - group
      - mode
