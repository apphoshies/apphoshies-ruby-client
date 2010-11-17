$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ApphoshiesClient
  VERSION = '0.4.0'
end

require "rubygems"
gem 'activeresource'
require 'active_resource'

ActiveResource::Base.include_root_in_json = true

require 'apphoshies_client/class_methods'
require 'apphoshies_client/configuration'
@@apphoshies_configuration = ApphoshiesClient::Configuration.new
@@apphoshies_configuration.site = 'https://service.apphoshies.com'
@@apphoshies_configuration.username = ''
@@apphoshies_configuration.api_key = ''
@@apphoshies_configuration.app_id = ''

require 'apphoshies_client/device_token'
require 'apphoshies_client/document'
require 'apphoshies_client/message'
require 'apphoshies_client/file_upload'
