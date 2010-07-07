class ApphoshiesClient::Message < ActiveResource::Base
  self.site = 'http://localhost:3000'
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
end
