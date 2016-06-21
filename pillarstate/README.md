# pillarstate-formula

Meta-formula for generating states directly from pillar.

Usage:

```
pillarstate:
  file:
    directory:
      /etc/nginx/ssl:
        user: root
        group: root
        dir_mode: 750
      /var/log/journal:
        user: root
        group: systemd-journal
  pkg:
    purged:
      lxc:
        pkgs: [ lxd, lxd-client, lxcfs, liblxc1, lxc-common ]
      irqbalance:
      mdadm:
    installed:
      salt-minion:
```
