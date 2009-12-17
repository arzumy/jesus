require 'yaml'

module Jesus
  def self.config(name)
    @config = Jesus::Config.load_config if @config.nil?
    return '' if @config[name].nil?
    return @config[name]
  end
  
  def self.reset_config
    @config = nil
  end
    
  class Config
    def self.load_config
      config = YAML.load_file(File.join('config.yml'))
      return Hash.new if !config.is_a?(Hash)
      config
    end
  end
end
