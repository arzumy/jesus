require 'god'

module Jesus
  #
  # Interface between jesus and god
  #
  class Interface
    attr_reader :server
    
    def initialize
        @server = DRbObject.new(nil, God::Socket.socket(17165))
    end
    
    
    #
    # We retrieve the processes by group
    #
    def status
      begin
        statuses = server.status
      rescue
        return nil
      end
      groups = Hash.new
      
      statuses.each do |name, status|
        g = status[:group] || ''
        groups[g] ||= Hash.new
        groups[g][name] = status
      end
      groups
    end
    
    #
    # We execute a specific command to god
    # Could be "start", "stop", "restart", "quit", "terminate"
    #
    def command(command, name)
      begin
        server.control(name, command)
      rescue
        return nil
      end
    end
    
    #
    # Gets the god's logs for one process since some time
    # By default, gets all the logs
    #
    def log(name=nil, start=Time.at(0))
      begin
        server.running_log(name, start).split("\n")
      rescue
        nil
      end
    end
  end
end