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
    def validate!
      self.class.instance_variable_get(:@validations).each do |validation_clause|
        attr_name = instance_variable_get("@#{validation_clause[0]}")
        validation_type = validation_clause[1]
        validation_standart = validation_clause[2]
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

    def valid?
      validate!
      true
    rescue
      false
    end
  end
end
