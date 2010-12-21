class ApphoshiesClient::Document < ApphoshiesClient::Base
  self.site = @@apphoshies_configuration.site
  self.format = :json
  headers['APH_USERNAME'] = @@apphoshies_configuration.username
  headers['APH_API_KEY'] = @@apphoshies_configuration.api_key

  def self.all(options = {})
    if options and options[:datasource]
      find_by_datasource(options[:datasource], options)
    else
      raise ApphoshiesClient::MissingDatasourceException, 'Please provide a datasource option!'
    end
  end

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
    elsif value.is_a?(Fixnum)
      _values << {key => value, "type" => 'Integer'}
    elsif value.is_a?(Float)
      _values << {key => value, "type" => 'Float'}
    elsif value.is_a?(TrueClass) or value.is_a?(FalseClass)
      _values << {key => value, "type" => 'Boolean'}
    elsif value.is_a?(DateTime)
      _values << {key => value, "type" => 'DateTime'}
    else
      raise ApphoshiesClient::ValueTypeNotSupportedException
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
end
