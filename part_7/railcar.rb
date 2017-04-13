require_relative 'manufacturer'
require_relative 'instance_counter'

class RailCar
  include Manufacturer
  include InstanceCounter

  attr_reader :number

  def initialize(*args)
    register_instance
    @number = self.class.instances # номер вагона будет автоматически назначаться по номеру интсанса класса
  end
end