#
class login_defs (
  $mail_dir        = $::login_defs::params::mail_dir,
  $pass_max_days   = $::login_defs::params::pass_max_days,
  $pass_min_days   = $::login_defs::params::pass_min_days,
  $pass_min_len    = $::login_defs::params::pass_min_len,
  $pass_warn_age   = $::login_defs::params::pass_warn_age,
  $uid_min         = $::login_defs::params::uid_min,
  $uid_max         = $::login_defs::params::uid_max,
  $gid_min         = $::login_defs::params::gid_min,
  $gid_max         = $::login_defs::params::gid_max,
  $userdel_cmd     = $::login_defs::params::userdel_cmd,
  $create_home     = $::login_defs::params::create_home,
  $umask           = $::login_defs::params::umask,
  $usergroups_enab = $::login_defs::params::usergroups_enab,
  $encrypt_method  = $::login_defs::params::encrypt_method,
  $template        = 'login_defs/login.defs.erb',
  $options         = {},
) inherits login_defs::params {

  validate_absolute_path($mail_dir)
  validate_re($pass_max_days, '^\d+$', 'pass_max_days must be a number')
  validate_re($pass_min_days, '^\d+$', 'pass_min_days must be a number')
  validate_re($pass_min_len, '^\d+$', 'pass_min_len must be a number')
  validate_re($pass_warn_age, '^\d+$', 'pass_warn_age must be a number')
  validate_re($uid_min, '^\d+$', 'uid_min must be a number')
  validate_re($uid_max, '^\d+$', 'uid_max must be a number')
  validate_re($gid_min, '^\d+$', 'gid_min must be a number')
  validate_re($gid_max, '^\d+$', 'gid_max must be a number')
  validate_re($create_home, '^(yes|no)$', 'create_home must be yes or no')
  validate_re($umask, '^\d{3,4}$', 'umask must be a 3-4 digit number')
  validate_re($usergroups_enab, '^(yes|no)$', 'usergroups_enab must be yes or no')
  validate_hash($options)

  file { '/etc/login.defs':
    ensure  => 'file',
    owner   => 'root',
    group   => '0',
    content => template($template),
  }

}
