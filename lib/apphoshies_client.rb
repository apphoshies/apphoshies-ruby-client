$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ApphoshiesClient
  VERSION = '0.0.1'
end

require "rubygems"
gem 'activeresource'
require 'active_resource'

require 'apphoshies_client/configuration'
# TODO yml file

@@apphoshies_configuration = ApphoshiesClient::Configuration.new
@@apphoshies_configuration.username = 'oliver'
@@apphoshies_configuration.api_key = 'f6bc464e82c04cfa85417d08'
@@apphoshies_configuration.app_id = 'Apphoshies'

require 'apphoshies_client/finder_methods'
require 'apphoshies_client/device_token'
require 'apphoshies_client/document'
require 'apphoshies_client/message'
