{% from "sysctl/map.jinja" import sysctl with context %}

sysctl_conf:
  file.managed:
    - name: {{ sysctl.conf }}
    - mode: {{ sysctl.mode }}
    - group: {{ sysctl.group }}
    - user: {{ sysctl.user }}
    - source: {{ sysctl.source }}
    - template: {{ sysctl.template }}

# Note: On Linux this adds /etc/sysctl.d/99-salt; on OpenBSD it manages
# /etc/sysctl.conf directly.
{% for k,v in salt['pillar.get']('sysctl:config', {}).iteritems(): %}
sysctl_{{ k }}:
  sysctl.present:
    - name: {{ k }}
    - value: {{ v }}
{% endfor %}
