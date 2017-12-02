[![Build Status](https://travis-ci.org/lwm/dotfiles.svg?branch=master)](https://travis-ci.org/lwm/dotfiles)

# dotfiles

My [Debian Stretch] system configuration files, managed with [Ansible].

[Debian Stretch]: https://www.debian.org/
[Ansible]: https://www.ansible.com/

Mostly plundered on the high seas of the internet.

Each commits is tested via Travis CI, so I can be sure that a new system
will be configured correctly. It's setup quite modularly. If you
understand the basics of Ansible, then it should be very easy to fork it
and adapt as you need. All roles are called one by one from
`bootstrap.yml`.

# Install

From a fresh install of Debian Stretch, you can run:

```bash
$ sudo apt-get install ansible
$ make bootstrap
```
