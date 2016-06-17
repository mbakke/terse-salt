{% if grains['os_family'] == 'Debian' %}
acmetool_repository:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/hlandau/rhea/ubuntu xenial main
    - keyserver: keyserver.ubuntu.com
    - keyid: 9862409EF124EC763B84972FF5AC9651EDB58DFA
    - require_in:
      - pkg: acmetool_package
{% endif %}
