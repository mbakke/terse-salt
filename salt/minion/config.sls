#!pydsl

import yaml

if 'salt' in __pillar__:
  if 'minion' in __pillar__['salt']:
    config_data = __pillar__['salt']['minion']
    if isinstance(config_data,dict):
      config_state = state('salt_minion_config')
      config_state.file('managed',
              name='/etc/salt/minion',
              mode='0644',
              contents=yaml.dump(config_data))
