require 'spec_helper'

describe 'login_defs' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "login_defs class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'login_defs class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

    end
  end
end
