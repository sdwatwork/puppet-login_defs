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

end
