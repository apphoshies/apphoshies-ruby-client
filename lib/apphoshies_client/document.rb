class ApphoshiesClient::Document < ActiveResource::Base
  extend ClassMethods

  self.site = @@apphoshies_configuration.site
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
  
  def self.get(query_symbol, options = {})
    reload_http_headers
    return find(query_symbol, :params => {:app_id => @@apphoshies_configuration.app_id}) if query_symbol.is_a?(String)
    default_options = {:app_id => @@apphoshies_configuration.app_id, :limit => 100}
    find(:all, :params => default_options.merge(options))
  end

  def self.all(options = {})
    reload_http_headers
    get(:all, options)
  end

  def self.find_by_datasource(datasource, options = {})
    reload_http_headers
    get(:all, options.merge(:datasource => datasource))
  end
  
  def self.find_one(id); get(id); end
  
  def get_value(key)
    if self.values
      v = self.values.select {|value_object| value_object.respond_to?(key.to_sym)}
      return v.first.send(key.to_sym) if v and v.any?
    end
  end

  def set_value(key, value)
    _values = self.values.collect {|v| v.attributes}
    if value.is_a?(String)
      _values << {key => value, "type" => value.class.name.to_s}
      # TODO check other types!
    else
      raise "Value type not supported yet!"
    end
    self.values = _values
  end

  def method_missing(m, *args, &block)
    unless m.to_s == ('values')
      _object = get_value(m.to_s)
      return _object if _object
    end
    begin
      super(m, *args, &block)
    rescue => e
      return nil
    end
  end
  
  private
  def self.reload_http_headers
    headers['APH_USERNAME'] = @@apphoshies_configuration.username
    headers['APH_API_KEY'] = @@apphoshies_configuration.api_key
  end
end
