require 'sinatra/base'
require 'jesus/interface'
require 'jesus/server/helpers'
require 'json'

module Jesus
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
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
      show @status.nil? ? :error : :home
    end
    
    #
    # Displays a process log
    #
    get '/logs/:process' do
      @log = Jesus::Interface.new.log(params[:process])
      show @log.nil? ? :error : :log
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
    get '/command/:command/:process' do
      @command = Jesus::Interface.new.command(params[:command], params[:process])
      flash(:notice, 'The command ' + params[:command] + ' has successfully been executed. It might take a few seconds before the status process effectively changes.')
      redirect '/'
    end
    
    #
    # Displays every process and it's status in json format
    #
    get '/json' do
      Jesus::Interface.new.status.to_json
    end
  end
end