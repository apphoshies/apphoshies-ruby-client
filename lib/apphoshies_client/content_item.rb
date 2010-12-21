class ApphoshiesClient::ContentItem < ApphoshiesClient::Document
  self.element_name = "document"

  def self.all(options = {})
    find_by_datasource('content_items', options)
  end
end
