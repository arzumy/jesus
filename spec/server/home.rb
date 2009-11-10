require File.dirname(__FILE__) + '/../spec_helper'

describe "The home page" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra.new Jesus::Server
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
end
