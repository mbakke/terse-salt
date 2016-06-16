# terse-salt

This is a set of [Salt](https://docs.saltstack.com/en/latest/) formulas aimed to be entirely Pillar-driven.

Work in progress. Contributions welcome.

# Examples

Coming soon.

# Bugs

Many.

# Compatibility

The minimum supported salt version is **2015.8.4**. Older distros are encouraged to use the upstream [Salt repository](https://repo.saltstack.com).

We try to support the following operating systems:

* Debian 8
* Ubuntu 16.04
* CentOS 7
* OpenBSD 5.9

Support for other platforms welcome.

# Frequently asked questions

## Why are you reinventing the wheel? Why not use the upstream formulas?

The Github [saltstack-formulas](https://github.com/saltstack-formulas) organization contain some high-quality formulas such as [postgres](https://github.com/saltstack-formulas/postgres-formula) that have deliberately not been included here. Others are overly complex and/or have wildly different semantics.

The aim of this project is to provide clean, reusable states with minimal code and a common interface. Another goal is first-class OpenBSD support, although not all states are tested on each platform.

# License

[ASL-2](https://www.apache.org/licenses/LICENSE-2.0.html)
