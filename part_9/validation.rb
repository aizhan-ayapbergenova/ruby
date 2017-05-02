module Validation
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, validation_type, validation_format="")
      @options = {}
      @options[attr_name] = { validation_type: validation_format }
    end

    def options
      @options
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get(:@options).each do |key, value|
        key = instance_variable_get("@#{key}")
        self.send(:presence, key)
      end
    end

    def presence(attribute)
      raise "ERROR" if attribute.nil? || attribute.empty?
    end
  end

end

class Test
  include Validation

  attr_accessor :name, :number, :station
  validate :name, :presence

  def initialize(name)
    @name = name
    @number = number
    validate!
  end
end