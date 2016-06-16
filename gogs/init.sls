{% from "gogs/map.jinja" import gogs with context %}

{% if gogs.use_upstream_repo %}
include:
  - gogs.repo
{% endif %}

{% if gogs.manage_package %}
gogs_package:
  pkg.installed:
    - name: {{ gogs.package_name }}
{% endif %}

gogs_service:
  service.{{ gogs.service_state }}:
    - name: {{ gogs.service_name }}
    - enable: {{ gogs.service_enable }}

# Gogs generates app.ini on install. To avoid duplicating all custom
# options in pillar, we only override them here.
{% if salt['pillar.get']('gogs:config') is defined %}
gogs_config:
  ini.options_present:
    - name: {{ gogs.app_ini_path }}
    - watch_in:
      - service: gogs_service
    - sections:
{%- for section,options in salt['pillar.get']('gogs:config', {}).iteritems(): %}
        {{ section }}:
{%- for opt,val in options.iteritems(): %}
          {{ opt }}: {{ val }}
{%- endfor %}
{%- endfor %}
{%- endif %}
