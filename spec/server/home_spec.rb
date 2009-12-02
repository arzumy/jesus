require File.dirname(__FILE__) + '/../spec_helper'

describe "The home page" do
  include Rack::Test::Methods
  include Jesus::Spec

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
  
  it 'should display a process logs' do
    class Jesus::Interface
      def log(name); ['First Log Line', 'Second Log Line']; end
    end
    
    get '/logs/test'
    last_response.should be_ok
    last_response.should match(/<h1>Logs for test<\/h1>/)
    last_response.should match(/<textarea>First Log Line\r\nSecond Log Line<\/textarea>/)
  end
  
  it 'should execute the command' do
    get '/command/start/jesus'
    last_response.should be_redirect
  end
  
  it 'should render the json page' do
    get '/json'
    last_response.should be_ok
  end
end
