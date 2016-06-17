# acmetool-formula

Installs the [acmetool](https://github.com/hlandau/acme) Let's Encrypt client.

This will run `acmetool quickstart` with the provided answer file to set up required directories and hooks.

It is highly recommended to override the example email address with your own by adding it to Pillar.

```
acmetool:
  config:
    acme-enter-email: you@example.com
```

It defaults to non-root proxy mode with 4096 bit RSA keys. Look through `response.defaults.yaml` for other tunables.

## TODO

* multi-platform support (only Debian/Ubuntu currently, with acme repo)
* execution module for requesting and renewing certificates
