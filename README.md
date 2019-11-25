andrewrothstein.govc
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-govc.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-govc)

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
