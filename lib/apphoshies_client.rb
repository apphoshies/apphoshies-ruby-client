$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ApphoshiesClient
  VERSION = '0.1'
end

require "rubygems"
gem 'activeresource'
require 'active_resource'

ActiveResource::Base.include_root_in_json = true

require 'apphoshies_client/configuration'
@@apphoshies_configuration = ApphoshiesClient::Configuration.new
@@apphoshies_configuration.config
@@apphoshies_configuration.site = 'https://service.apphoshies.com'

require 'apphoshies_client/device_token'
require 'apphoshies_client/document'
require 'apphoshies_client/message'
