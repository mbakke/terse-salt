base:
  '*':
{%- for state in salt['pillar.get']('states', []): %}
    - {{ state }}
{%- endfor -%}
