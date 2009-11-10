require 'sinatra/base'
require 'sinatra_more/render_plugin'

module Jesus
  class Server < Sinatra::Base
    register SinatraMore::RenderPlugin
    
    #
    # The home
    # Displays the list of the process
    #
    get '/' do
      erb_template 'home'
    end
  end
end