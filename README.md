andrewrothstein.govc
=========
![Build Status](https://github.com/andrewrothstein/ansible-govc/actions/workflows/build.yml/badge.svg)

Installs VMwares [govc](https://github.com/vmware/govmomi).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.govc
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
