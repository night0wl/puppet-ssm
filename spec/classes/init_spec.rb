require 'spec_helper'
describe 'ssm' do

  context 'with defaults for all parameters' do
    it { should contain_class('ssm') }
  end
end
