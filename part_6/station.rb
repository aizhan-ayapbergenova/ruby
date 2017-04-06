require_relative 'validator'

class Station
  attr_reader :trains, :name

  include Validator

  @stations = []

  def self.all
    @stations
  end

  def initialize(name)
    @name = name
    station_validate!
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
end