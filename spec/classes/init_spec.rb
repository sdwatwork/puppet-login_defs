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

end
