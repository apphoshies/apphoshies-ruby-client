class ApphoshiesClient::Document < ActiveResource::Base
  extend ApphoshiesClient::FinderMethods
  self.site = 'http://localhost:3000'
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
  
  def self.get(query_symbol, options = {})
    return find(query_symbol, :params => {:app_id => @@apphoshies_configuration.app_id}) if query_symbol.is_a?(String)
    default_options = {:app_id => @@apphoshies_configuration.app_id, :limit => 100}
    find(:all, :params => default_options.merge(options))
  end

  def self.find_by_datasource(datasource, options = {})
    get(:all, options.merge(:datasource => datasource))
  end
  
  def self.find_one(id); get(id); end
end
