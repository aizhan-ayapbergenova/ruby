require_relative 'manufacturer'
require_relative 'validator'

class Train
  @@trains = {}

  include Manufacturer
  include Validator

  attr_reader :speed, :railcars, :number

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    train_validate!
    @railcars = []
    @speed = 0
    @@trains[number] = self
  end

  def increase_speed
    @speed += 10
  end

  def reset_speed
    @speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0
  end

  def forward
    if next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @station_index += 1
    end
  end

  def backward
    if previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @station_index -= 1
    end
  end

  def current_station
    @route.stations[@station_index]
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def stop?
    speed.zero?
  end

  def attach_railcar(railcar)
    @railcars << railcar if railcar.class.to_s == @railcar_type && stop?
  end

  def unhook_railcar
    @railcars.pop if stop?
  end
end
