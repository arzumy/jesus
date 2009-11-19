require 'sinatra/base'
require 'sinatra_more/render_plugin'
require 'jesus/interface'
require 'jesus/server/helpers'

module Jesus
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    register SinatraMore::RenderPlugin
    include Jesus::Helpers
    
    set :views, "#{dir}/server/views"
    set :public, "#{dir}/server/public"
    set :static, true
    enable :sessions
    
    #
    # The home
    # Displays the list of the process
    #
    get '/' do
      @status = Jesus::Interface.new.status
      erb_template @status.nil? ? :error : :home
    end
    
    #
    # Displays a process log
    #
    get '/logs/:process' do
      @log = Jesus::Interface.new.log(params[:process])
      erb_template @log.nil? ? :error : :log
    end
    
    #
    # Displays every page logs
    #
    get '/logs' do
      flash(:notice, 'You currently can not display all the logs. You should select a process first.')
      redirect '/'
    end
    
    #
    # Executes a command (start, restart, stop, quit or terminate) on the server
    #
    post '/command/:command/:process' do
      @command = Jesus::Interface.new.command(params[:command], params[:process])
      redirect '/'
    end
  end
end