include:
  - salt.minion.config

salt_minion:
  pkg.installed:
    - name: salt-minion
