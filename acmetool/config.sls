{% from "acmetool/map.jinja" import acmetool with context %}

# this needs to be temporarily writable when running quickstart
acmetool_hooks_setup:
  file.directory:
    - user: {{ acmetool.user }}
    - name: {{ acmetool.hooks_directory }}
    - use:
      - file: acmetool_hooks_directory
    - onchanges: # workaround for salt #32956
      - file: acmetool_response_file

# build a response file based on response.yaml
# override individual options with acmetool:config in pillar
acmetool_response_file:
  file.managed:
    - name: {{ acmetool.response_file }}
    - makedirs: True
    - mode: 644
    - user: {{ acmetool.user }}
    - group: {{ acmetool.group }}
    - source: salt://acmetool/response.jinja
    - template: jinja
    - require:
      - file: acmetool_directory

acmetool_quickstart:
  cmd.run:
    - name: acmetool quickstart --batch --response-file={{ acmetool.response_file }}
    - runas: {{ acmetool.user }}
    - cwd: {{ acmetool.directory }}
    - onchanges:
      - file: acmetool_response_file
    - require:
      - file: acmetool_response_file
      - file: acmetool_hooks_setup
    - reload_modules: True # set hook permissions back

acmetool_reconcile:
  cron.present:
    - name: acmetool --batch reconcile
    - user: {{ acmetool.user }}
    - minute: {{ acmetool.cronjob_minute }}
    - hour: {{ acmetool.cronjob_hour }}
    - daymonth: {{ acmetool.cronjob_daymonth }}
