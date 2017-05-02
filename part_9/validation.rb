module Validation
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, validation_type, validation_format="")
      @options ||= {}
      @options[attr_name] = { validation_type: validation_format } 
    end
  end

  module InstanceMethods 
    def validate!
      self.class.instance_variable_get(:@options).each do |attr_name, attr_validation| 
        attr_name = instance_variable_get("@#{attr_name}")
        self.send(:presence, attr_name)
      end 
    end 

    def presence(attribute)
      raise if attribute.nil? || attribute.empty?
    end
  end
end

class Test
  include Validation

  attr_accessor :name, :number, :station
  validate :name, :presence
  validate :number, :presence

  def initialize(name, number)
    @name = name
    @number = number
    validate!
  end
end
