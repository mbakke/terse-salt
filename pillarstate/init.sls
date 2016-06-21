{% from "pillarstate/macros.jinja" import salt_pillar_state as pillar_state %}

{% for module,states in salt['pillar.get']('pillarstate', {}).iteritems(): %}
{% for state,name in states.iteritems(): %}
{{ pillar_state(module, state, name) }}
{% endfor %}
{% endfor %}
