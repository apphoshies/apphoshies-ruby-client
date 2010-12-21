class ApphoshiesClient::TrackingItem < ApphoshiesClient::Document
  self.element_name = "document"

  def self.all(options = {})
    find_by_datasource('tracking_items', options)
  end
end
