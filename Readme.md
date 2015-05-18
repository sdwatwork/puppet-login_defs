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

Additional parameters:

* `template`

Specifies a custom template to use.  Defaults to `login_defs/login.defs.erb`

* `options`

Extra options to add to the file.  These will be appended to the end.
This should be a hash.

For example:

```puppet
class { '::login_defs':
  options => {
    'MD5_CRYPT_ENAB' => 'no',
    'FAIL_DELAY'     => '5',
  },
}
```


## Limitations

Only supports RedHat family operating systems right now.

## Authors

Josh Beard, jbeard@usgs.gov
