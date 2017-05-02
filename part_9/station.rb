require_relative 'accessors'
require_relative 'train'
require_relative 'validation'

class Station
  include Validation

  @stations = []

  def self.all
    @stations
  end

  ATTR_NAME = /^([a-z\d]\s?-?)*$/i

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def station_trains(type)
    @trains.select { |train| train.class.to_s == type }
  end

  def pass_train(&block)
    @trains.each_with_index do |train, index|
      block.call(train, index)
    end
  end

  # def valid?
  #   validate!
  #   true
  # rescue
  #   false
  # end

  # def validate!
  #   raise 'Enter the name of the station' if name.length.zero?
  #   raise 'The name is incorrect' if name !~ ATTR_NAME
  # end
end
