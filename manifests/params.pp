#
class login_defs::params {

  case $::osfamily {
    'RedHat': {
      $mail_dir        = '/var/spool/mail'
      $pass_max_days   = '99999'
      $pass_min_days   = '0'
      $pass_min_len    = '5'
      $pass_warn_age   = '7'
      $uid_min         = '500'
      $uid_max         = '60000'
      $gid_min         = '500'
      $gid_max         = '60000'
      $create_home     = 'yes'
      $umask           = '022'
      $usergroups_enab = 'yes'
      $encrypt_method  = 'SHA512'
      $userdel_cmd     = undef
    }
    default: {
      fail("${::osfamily} not supported by ${module_name}")
    }
  }

}
