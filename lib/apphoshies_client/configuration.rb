class ApphoshiesClient::Configuration
  attr_accessor :site, :username, :api_key, :app_id
  
  def config(scope = 'default', cfg_path = "apphoshies.yml")
    read_config(cfg_path)
    if @config and @config[scope]
      self.username = @config[scope]['username']
      self.api_key = @config[scope]['api_key']
      self.app_id = @config[scope]['app_id']
    end
    self.site = 'https://service.apphoshies.com'
  end

  def read_config(cfg_path)
    if File.exists?(cfg_path)
      puts "Using config: #{cfg_path}"
      @config = YAML.load(File.read(cfg_path))
    else
      begin
        puts "Using config in your home directory"
        @config = YAML.load(File.read("#{ENV['HOME']}/.apphoshies.yml"))
      rescue Errno::ENOENT
        puts ">>> apphoshies.yml expected in current directory or ~/.apphoshies.yml"
      end
    end
  end
end
