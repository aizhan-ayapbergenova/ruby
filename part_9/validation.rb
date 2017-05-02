module Validation
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, validation_type, validation_format = nil)
      @options ||= {}
      @options[attr_name] = { "#{validation_type}": validation_format }
    end
  end

  module InstanceMethods 
    def validate!
      self.class.instance_variable_get(:@options).each do |attr_name, attr_validation| 
        attr_name = instance_variable_get("@#{attr_name}")
        validation_type = attr_validation.keys[0]
        validation_standart = attr_validation.values[0]
        self.send(validation_type, attr_name, validation_standart)
      end
    end 

    def presence(attribute, *args)
      raise "Wrong name" if attribute.nil? || attribute.empty?
    end

    def format(attribute, standart)
      raise "Wrong format" if attribute.to_s !~ standart
    end

    def type(attribute, attribute_class)
      raise "Wrong type" if attribute.class != attribute_class
    end

    def valid?
      validate!
      true
    rescue
      false
    end
  end
end