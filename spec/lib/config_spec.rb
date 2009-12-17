require File.dirname(__FILE__) + '/../spec_helper'
require 'jesus/config'

describe "Config" do
  
  it 'should load the config parameter' do
    # We must reset the config because it's already been loaded by the other tests
    Jesus.reset_config
    Jesus::Config.should_receive(:load_config).and_return({'god_port' => 1})
    Jesus.config('god_port').should eql(1)
  end
  
  it 'should not load the config if it\'s already been' do
    # We must reset the config because it's already been loaded by the other tests
    Jesus.reset_config
    # We use the default config port
    Jesus.config('god_port').should eql(17165)
    
    # And we change the port, to see if it's reloaded
    Jesus::Config.should_receive(:load_config).and_return({'god_port' => 1})
    Jesus.config('god_port').should eql(17165)
    
    # Just for safety, we reload the config with the new value
    Jesus.reset_config
    Jesus.config('god_port').should eql(1)
  end
end
