class ApphoshiesClient::Message < ApphoshiesClient::Base
  self.site = @@apphoshies_configuration.site
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key

  def self.find_by_application_client_key(application_client_key, options = {})
    default_options = {:limit => 100, :last_check_at => 1440, :application_client_key => application_client_key}
    unless application_client_key.blank?
      get(:all, default_options.merge(options))
    else
      raise ApphoshiesClient::MissingApplicationClientKeyException
    end
  end
end
