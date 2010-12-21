class ApphoshiesClient::User < ApphoshiesClient::Document
  self.element_name = "document"

  def self.all(options = {})
    find_by_datasource('users', options)
  end
end
