{% for file,config in salt['pillar.get']('apt:config', {}).iteritems(): %}
apt_config_{{ file }}:
  file.managed:
    - name: "/etc/apt/apt.conf.d/{{ file }}"
    - mode: 444
    - user: root
    - group: root
    - source: salt://apt/apt.conf.j2
    - template: jinja
    - context:
      config_data:
        {{ config }}
{% endfor %}
