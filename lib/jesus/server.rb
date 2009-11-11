require 'sinatra/base'
require 'sinatra_more/render_plugin'
require 'jesus/interface'

module Jesus
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    register SinatraMore::RenderPlugin
    set :views, "#{dir}/server/views"
    set :public, "#{dir}/server/public"
    set :static, true
    
    #
    # The home
    # Displays the list of the process
    #
    get '/' do
      @status = Jesus::Interface.new.status
      erb_template 'home'
    end
  end
end