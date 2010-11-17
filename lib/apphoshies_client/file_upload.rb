class ApphoshiesClient::FileUpload < ActiveResource::Base
  extend ClassMethods

  self.site = @@apphoshies_configuration.site
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key

  def url
    "https://service.apphoshies.com/file_uploads/#{self.id}"
  end

  def self.find_by_application_client_key(application_client_key, options = {})
    reload_http_headers
    default_options = {:app_id => @@apphoshies_configuration.app_id, :application_client_key => application_client_key}
    find(:all, :params => default_options.merge(options))
  end
  
  def self.find_one(id); get(id); end
  
  def self.get(query_symbol, options = {})
    reload_http_headers
    return find(query_symbol, :params => {:app_id => @@apphoshies_configuration.app_id}) if query_symbol.is_a?(String)
    default_options = {:app_id => @@apphoshies_configuration.app_id, :limit => 100}
    find(:all, :params => default_options.merge(options))
  end
  
  private
  def self.reload_http_headers
    headers['APH_USERNAME'] = @@apphoshies_configuration.username
    headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
  end
end
