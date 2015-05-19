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

  context 'when called with custom template' do
    let(:params) {
      {
        :template => 'myorg/login.defs.erb',
      }
    }

    it { should contain_file('/etc/login.defs').with_content(
      /^CUSTOM_TEMPLATE\s+yes$/
    )}

    it { should contain_file('/etc/login.defs').with_content(
      /^PASS_MAX_DAYS\s+99999$/
    )}
  end

  context 'when called with custom parameters' do

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
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^PASS_MAX_DAYS\s+89$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^PASS_MIN_DAYS\s+79$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^PASS_MIN_LEN\s+16$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^PASS_WARN_AGE\s+14$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^UID_MIN\s+420$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^UID_MAX\s+50000$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^GID_MIN\s+419$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^GID_MAX\s+49999$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^USERDEL_CMD\s+\/usr\/bin\/foo$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^CREATE_HOME\s+no$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^UMASK\s+077$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^USERGROUPS_ENAB\s+no$/
      )
    end

    it do
      should contain_file('/etc/login.defs').with_content(
        /^ENCRYPT_METHOD\s+SHA256$/
      )
    end

  end

  context 'when called with bad parameter values' do
    context 'when called with invalid mail_dir' do
      let(:params) { { :mail_dir => 'invalid' } }
      it { should raise_error( Puppet::Error, /"invalid" is not an absolute path/ ) }
    end

    context 'when called with invalid pass_max_days' do
      let(:params) { { :pass_max_days => 'foo' } }
      it { should raise_error( Puppet::Error, /pass_max_days must be a number/ ) }
    end

    context 'when called with invalid pass_min_days' do
      let(:params) { { :pass_min_days => 'foo' } }
      it { should raise_error( Puppet::Error, /pass_min_days must be a number/ ) }
    end

    context 'when called with invalid pass_min_len' do
      let(:params) { { :pass_min_len => 'foo' } }
      it { should raise_error( Puppet::Error, /pass_min_len must be a number/ ) }
    end

    context 'when called with invalid pass_warn_age' do
      let(:params) { { :pass_warn_age => 'foo' } }
      it { should raise_error( Puppet::Error, /pass_warn_age must be a number/ ) }
    end

    context 'when called with invalid uid_min' do
      let(:params) { { :uid_min => 'foo' } }
      it { should raise_error( Puppet::Error, /uid_min must be a number/ ) }
    end

    context 'when called with invalid uid_max' do
      let(:params) { { :uid_max => 'foo' } }
      it { should raise_error( Puppet::Error, /uid_max must be a number/ ) }
    end

    context 'when called with invalid gid_min' do
      let(:params) { { :gid_min => 'foo' } }
      it { should raise_error( Puppet::Error, /gid_min must be a number/ ) }
    end

    context 'when called with invalid gid_max' do
      let(:params) { { :gid_max => 'foo' } }
      it { should raise_error( Puppet::Error, /gid_max must be a number/ ) }
    end

    context 'when called with invalid create_home' do
      let(:params) { { :create_home => 'definitely' } }
      it { should raise_error( Puppet::Error, /create_home must be yes or no/ ) }
    end

    context 'when called with invalid umask' do
      let(:params) { { :umask => '07700' } }
      it { should raise_error( Puppet::Error, /umask must be a 3-4 digit number/ ) }
    end

    context 'when called with invalid usergroups_enab' do
      let(:params) { { :usergroups_enab => 'absolutely' } }
      it { should raise_error( Puppet::Error, /usergroups_enab must be yes or no/ ) }
    end

  end

end
