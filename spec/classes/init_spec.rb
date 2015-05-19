require 'spec_helper'
describe 'login_defs' do

  let(:facts) do
    {
      :osfamily => 'RedHat',
    }
  end

  context 'with default parameters' do
    it { should contain_class('login_defs') }
  end

  context 'on an unsupported osfamily' do
    let(:facts) {{ :osfamily => 'Windows' }}
    it 'should fail when osfamily is windows' do
      should raise_error(
        Puppet::Error, /Windows not supported by login_defs/
      )
    end
  end

  context 'when called with custom parameters' do
    let(:facts) {
      {
        :osfamily => 'RedHat',
      }
    }

    let(:params) {
      {
        :mail_dir        => '/tmp/foo',
        :pass_max_days   => '89',
        :pass_min_days   => '79',
        :pass_min_len    => '16',
        :pass_warn_age   => '14',
        :uid_min         => '420',
        :uid_max         => '50000',
        :gid_min         => '419',
        :gid_max         => '49999',
        :userdel_cmd     => '/usr/bin/foo',
        :create_home     => 'no',
        :umask           => '077',
        :usergroups_enab => 'no',
        :encrypt_method  => 'SHA256',
        :options         => {
          'FAIL_DELAY'     => '5',
          'MD5_CRYPT_ENAB' => 'no',
        }
      }
    }

    it do
      should contain_file('/etc/login.defs').with_content(
        /^MAIL_DIR\s+\/tmp\/foo$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^PASS_MAX_DAYS\s+89$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^PASS_MIN_DAYS\s+79$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^PASS_MIN_LEN\s+16$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^PASS_WARN_AGE\s+14$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^UID_MIN\s+420$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^UID_MAX\s+50000$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^GID_MIN\s+419$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^GID_MAX\s+49999$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^USERDEL_CMD\s+\/usr\/bin\/foo$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^CREATE_HOME\s+no$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^UMASK\s+077$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^USERGROUPS_ENAB\s+no$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^ENCRYPT_METHOD\s+SHA256$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^FAIL_DELAY\s+5$/
      )

      should contain_file('/etc/login.defs').with_content(
        /^MD5_CRYPT_ENAB\s+no$/
      )
    end
  end

end
