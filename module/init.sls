{% from "module/macros.jinja" import salt_pillar_state as module_state %}

{% for module,states in salt['pillar.get']('module', {}).iteritems(): %}
{% for state,name in states.iteritems(): %}
{{ module_state(module, state, name) }}
{% endfor %}
{% endfor %}
