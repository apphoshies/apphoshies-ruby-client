class ApphoshiesClient::DeviceToken < ActiveResource::Base
  self.site = @@apphoshies_configuration.site
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
  
  def self.find_by_application_client_key(application_client_key, options = {})
    default_options = {:app_id => @@apphoshies_configuration.app_id, :application_client_key => application_client_key}
    find(:all, :params => default_options.merge(options))
  end
end
