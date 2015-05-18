# login_defs

## Overview

Manages `/etc/login.defs` on Linux systems.

## Usage

### Example

__Set the max days and minimum length for passwords:__

```puppet
class { '::login_defs':
  pass_max_days => '90',
  pass_min_len  => '12',
}
```

### Class: `login_defs`

#### Parameters

The following parameters are available.  These directly correspond to the
options in the `login.defs` file.

* `mail_dir`
* `pass_max_days`
* `pass_min_days`
* `pass_min_len`
* `pass_warn_age`
* `uid_min`
* `uid_max`
* `gid_min`
* `userdel_cmd`
* `create_home`
* `umask`
* `usergroups_enab`
* `encrypt_method`

You can also specify a custom template of your own via the `template`
parameter.

## Limitations

Only supports RedHat family operating systems right now.

## Authors

Josh Beard, jbeard@usgs.gov
