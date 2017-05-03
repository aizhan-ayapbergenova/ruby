module Validation
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, validation_type, validation_standart = nil)
      @validations ||= []
      @validations << [attr_name, validation_type, validation_standart]
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def validate!
      self.class.instance_variable_get(:@validations).each do |attr_value|
        attr_name = instance_variable_get("@#{attr_value[0]}")
        validation_type = attr_value[1]
        validation_standart = attr_value[2]
        send(validation_type, attr_name, validation_standart)
      end
    end

    def presence(attribute, *_args)
      raise 'Wrong name' if attribute.nil? || attribute.empty?
    end

    def format(attribute, standart)
      raise 'Wrong format' if attribute.to_s !~ standart
    end

    def type(attribute, attribute_class)
      raise 'Wrong type' if attribute.class != attribute_class
    end
  end
end
