require File.dirname(__FILE__) + '/../spec_helper'

describe "The home page" do
  include Rack::Test::Methods
  include Jesus::Spec

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  it 'should execute the command' do
    post '/command/start/jesus'
    last_response.should be_redirect
  end
end
