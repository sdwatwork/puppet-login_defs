# login_defs

[![Build Status](https://travis-ci.org/joshbeard/puppet-login_defs.svg?branch=master)](https://travis-ci.org/joshbeard/puppet-login_defs)

## Overview

Manages `/etc/login.defs` on Linux systems.

## Usage

### Class: `login_defs`

#### Parameters

##### `mode`

Specifies the file mode for `/etc/login.defs`.  Defaults to `0644`.

##### `owner`

Specifies the file owner for `/etc/login.defs`. Defaults to 'root'

##### `group`

Specifies the file group for `/etc/login.defs`. Defaults to '0'

##### `options`

A _hash_ of options to populate the `login.defs` file with.

Reference the `login.defs(5)` man page for a list of configuration items and
their description.  [http://linux.die.net/man/5/login.defs](http://linux.die.net/man/5/login.defs)

* Any option you add here will be *merged* with the default options.
* You can override a default value here as well by using a key with the same
  name.
* You can remove a default option by specifying `undef` or an empty string for
  its value.
* Your options will *not* be validated for correctness.

For example:

All the default options *plus* `MY_CUSTOM_OPT` being added:

```puppet
class { '::login_defs':
  options => {
    'MY_CUSTOM_OPT' => 'foo',
  },
}
```

Default `ENCRYPT_METHOD` overridden with 'SHA256':

```puppet
class { '::login_defs':
  options => {
    'ENCRYPT_METHOD' => 'SHA256',
  },
}
```

Remove the default `ENCRYPT_METHOD` entirely:


```puppet
class { '::login_defs':
  options => {
    'ENCRYPT_METHOD' => undef,
  },
}
```

__Default Options:__

__RedHat 5/6:__

```ruby
{
'CREATE_HOME'     => 'yes',
'ENCRYPT_METHOD'  => 'SHA512',
'GID_MAX'         => '60000',
'GID_MIN'         => '500',
'MAIL_DIR'        => '/var/spool/mail',
'PASS_MAX_DAYS'   => '99999',
'PASS_MIN_LEN'    => '5',
'PASS_WARN_AGE'   => '7',
'UID_MAX'         => '60000',
'UID_MIN'         => '500',
'UMASK'           => '022',
'USERGROUPS_ENAB' => 'yes',
}
```

__RedHat 7:__

```ruby
{
'CREATE_HOME'     => 'yes',
'ENCRYPT_METHOD'  => 'SHA512',
'GID_MAX'         => '60000',
'GID_MIN'         => '1000',
'MAIL_DIR'        => '/var/spool/mail',
'PASS_MAX_DAYS'   => '99999',
'PASS_MIN_DAYS'   => '0',
'PASS_MIN_LEN'    => '5',
'PASS_WARN_AGE'   => '7',
'SYS_GID_MAX'     => '999',
'SYS_GID_MIN'     => '201',
'SYS_UID_MAX'     => '999',
'SYS_UID_MIN'     => '201',
'UID_MAX'         => '60000',
'UID_MIN'         => '1000',
'UMASK'           => '077',
'USERGROUPS_ENAB' => 'yes',
}
```

__Debian:__

```ruby
{
'CHFN_RESTRICT'    => 'rwh',
'CREATE_HOME'      => 'yes',
'DEFAULT_HOME'     => 'yes',
'ENCRYPT_METHOD'   => 'SHA512',
'ENV_PATH'         => 'PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games',
'ENV_SUPATH'       => 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
'ERASECHAR'        => '0177',
'FAILLOG_ENAB'     => 'yes',
'FTMP_FILE'        => '/var/log/btmp',
'GID_MAX'          => '60000',
'GID_MIN'          => '1000',
'HUSHLOGIN_FILE'   => '.hushlogin',
'KILLCHAR'         => '025',
'LOG_OK_LOGINS'    => 'no',
'LOG_UNKFAIL_ENAB' => 'no',
'LOGIN_RETRIES'    => '5',
'LOGIN_TIMEOUT'    => '60',
'MAIL_DIR'         => '/var/mail',
'MD5_CRYPT_ENAB'   => 'no',
'PASS_MAX_DAYS'    => '99999',
'PASS_MIN_DAYS'    => '0',
'PASS_WARN_AGE'    => '7',
'SU_NAME'          => 'su',
'SYSLOG_SG_ENAB'   => 'yes',
'SYSLOG_SU_ENAB'   => 'yes',
'TTYGROUP'         => 'tty',
'TTYPERM'          => '0600',
'UID_MAX'          => '60000',
'UID_MIN'          => '1000',
'UMASK'            => '022',
'USERGROUPS_ENAB'  => 'yes',
}
```

__Gentoo:__

```ruby
{
'FAIL_DELAY'       => '3'
'LOG_UNKFAIL_ENAB' => 'no'
'LOG_OK_LOGINS'    => 'no'
'SYSLOG_SU_ENAB'   => 'yes'
'SYSLOG_SG_ENAB'   => 'yes'
'CONSOLE'          => '/etc/securetty'
'SU_NAME'          => 'su'
'MAIL_DIR'         => '/var/spool/mail'
'HUSHLOGIN_FILE'   => '.hushlogin'
'ENV_SUPATH'       => 'PATH=/sbin:/bin:/usr/sbin:/usr/bin'
'ENV_PATH'         => 'PATH=/bin:/usr/bin'
'TTYGROUP'         => 'tty'
'TTYPERM'          => '0600'
'ERASECHAR'        => '0177'
'KILLCHAR'         => '025'
'UMASK'            => '022'
'PASS_MAX_DAYS'    => '99999'
'PASS_MIN_DAYS'    => '0'
'PASS_WARN_AGE'    => '7'
'UID_MIN'          => '1000'
'UID_MAX'          => '60000'
'SYS_UID_MIN'      => '101'
'SYS_UID_MAX'      => '999'
'GID_MIN'          => '1000'
'GID_MAX'          => '60000'
'SYS_GID_MIN'      => '101'
'SYS_GID_MAX'      => '999'
'LOGIN_RETRIES'    => '5'
'LOGIN_TIMEOUT'    => '60'
'CHFN_RESTRICT'    => 'rwh'
'DEFAULT_HOME'     => 'yes'
'USERGROUPS_ENAB'  => 'yes'
}
```

__SLES 11:__

```ruby
{
'DEFAULT_HOME'     => 'yes'
'ENV_PATH'         => '/usr/local/bin:/usr/bin:/bin'
'ENV_ROOTPATH'     => '/sbin:/bin:/usr/sbin:/usr/bin'
'FAIL_DELAY'       => '3'
'HUSHLOGIN_FILE'   => '/etc/hushlogins'
'LASTLOG_ENAB'     => 'yes'
'LOG_UNKFAIL_ENAB' => 'no'
'LOGIN_RETRIES'    => '3'
'LOGIN_TIMEOUT'    => '60'
'MOTD_FILE'        => '/etc/motd'
'TTYTYPE_FILE'     => '/etc/ttytype'
'TTYGROUP'         => 'tty'
'TTYPERM'          => '0620'
'CHFN_AUTH'        => 'yes'
'CHFN_RESTRICT'    => 'rwh'
'PASS_MAX_DAYS'    => '99999'
'PASS_MIN_DAYS'    => '0'
'PASS_WARN_AGE'    => '7'
'SYSTEM_UID_MIN'   => '100'
'SYSTEM_UID_MAX'   => '499'
'UID_MIN'          => '1000'
'UID_MAX'          => '60000'
'SYSTEM_GID_MIN'   => '100'
'SYSTEM_GID_MAX'   => '499'
'GID_MIN'          => '1000'
'GID_MAX'          => '60000'
'CHARACTER_CLASS'  =>  '[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.-]*[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.$-]\?'
'UMASK'            => '022'
'GROUPADD_CMD'     => '/usr/sbin/groupadd.local'
'USERADD_CMD'      => '/usr/sbin/useradd.local'
'USERDEL_PRECMD'   => '/usr/sbin/userdel-pre.local'
'USERDEL_POSTCMD'  => '/usr/sbin/userdel-post.local'
}
```

__SLES 12:__

```ruby
{
'FAIL_DELAY'         => '3'
'LOG_UNKFAIL_ENAB'   => 'no'
'LOG_OK_LOGINS'      => 'no'
'SYSLOG_SU_ENAB'     => 'yes'
'SYSLOG_SG_ENAB'     => 'yes'
'CONSOLE'            => '/etc/securetty'
'MOTD_FILE'          => '/etc/motd'
'HUSHLOGIN_FILE'     => '/etc/hushlogins'
'ENV_SUPATH'         => 'PATH=/sbin:/bin:/usr/sbin:/usr/bin'
'ENV_PATH'           => 'PATH=/usr/local/bin:/usr/bin:/bin'
'ENV_ROOTPATH'       => '/sbin:/bin:/usr/sbin:/usr/bin'
'TTYGROUP'           => 'tty'
'TTYPERM'            => '0620'
'ERASECHAR'          => '0177'
'KILLCHAR'           => '025'
'UMASK'              => '022'
'PASS_MAX_DAYS'      => '99999'
'PASS_MIN_DAYS'      => '0'
'PASS_WARN_AGE'      => '7'
'UID_MIN'            => '1000'
'UID_MAX'            => '60000'
'SYS_UID_MIN'        => '100'
'SYS_UID_MAX'        => '499'
'SUB_UID_MIN'        => '100000'
'SUB_UID_MAX'        => '600100000'
'SUB_UID_COUNT'      => '65536'
'GID_MIN'            => '1000'
'GID_MAX'            => '60000'
'SYS_GID_MIN'        => '100'
'SYS_GID_MAX'        => '499'
'SUB_GID_MIN'        => '100000'
'SUB_GID_MAX'        => '600100000'
'SUB_GID_COUNT'      => '65536'
'LOGIN_RETRIES'      => '3'
'LOGIN_TIMEOUT'      => '60'
'CHFN_RESTRICT'      => 'rwh'
'ENCRYPT_METHOD'     => 'SHA512'
'ENCRYPT_METHOD_NIS' => 'DES'
'DEFAULT_HOME'       => 'yes'
'USERGROUPS_ENAB'    => 'no'
'CREATE_HOME'        => 'no'
'CHARACTER_CLASS'    => '[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.-]*[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.$-]\?'
'GROUPADD_CMD'       => '/usr/sbin/groupadd.local'
'USERADD_CMD'        => '/usr/sbin/useradd.local'
'USERDEL_PRECMD'     => '/usr/sbin/userdel-pre.local'
'USERDEL_POSTCMD'    => '/usr/sbin/userdel-post.local'
}

## Limitations

Only supports RedHat, Debian, Gentoo, and SLES family operating systems right now.

## Authors

Josh Beard, josh@signalboxes.net
