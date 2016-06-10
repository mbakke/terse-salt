include:
  - openssl

{% for file,args in salt['pillar.get']('openssl:dhparam', {}).iteritems(): %}
openssl_dhparam_{{ file }}:
  cmd.run:
    - creates: {{ file }}    
    - name: openssl dhparam -out {{ file }} {{ args }}
    - require:
      - pkg: openssl_package
{% endfor %}
