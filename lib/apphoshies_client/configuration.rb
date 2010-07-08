class ApphoshiesClient::Configuration
  attr_accessor :site, :username, :api_key, :app_id
  
  def config(scope = 'default')
    @config ||= read_config
    self.username = @config[scope]['username']
    self.api_key = @config[scope]['api_key']
    self.app_id = @config[scope]['app_id']
  end

  def read_config
    if File.exists?("apphoshies.yml")
      puts "Using config in this directory"
      @config = YAML.load(File.read("apphoshies.yml"))
    else
      begin
        puts "Using config in your home directory"
        @config = YAML.load(File.read("#{ENV['HOME']}/.apphoshies.yml"))
      rescue Errno::ENOENT
        raise "apphoshies.yml expected in current directory or ~/.apphoshies.yml"
      end
    end
  end
end
