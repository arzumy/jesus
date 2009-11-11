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
      statuses = server.status
      groups = Hash.new
      
      statuses.each do |name, status|
        g = status[:group] || ''
        groups[g] ||= Hash.new
        groups[g][name] = status
      end
      groups
    end
  end
end