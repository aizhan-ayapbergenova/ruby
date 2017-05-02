require_relative 'manufacturer'

class Train
  include Manufacturer
  @trains = {}
  
  class << self
    attr_reader :trains

    def find(number)
      @trains[number]
    end
  end

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i

  attr_reader :speed, :railcars, :number

  def initialize(number)
    @number = number
    validate!
    @railcars = []
    @speed = 0
    self.class.trains[number] = self
  end

  def increase_speed
    @speed += 10
  end

  def reset_speed
    @speed = 0
  end

  def route=(route)
    @route = route
    @route.stations[0].take_train(self)
    @station_index = 0
  end

  def forward
    return unless next_station
    current_station.send_train(self)
    next_station.take_train(self)
    @station_index += 1
  end

  def backward
    return unless previous_station
    current_station.send_train(self)
    previous_station.take_train(self)
    @station_index -= 1
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
    raise "Type mismatch!" unless railcar.class.to_s == @railcar_type && stop?
    @railcars << railcar
  end

  def unhook_railcar
    @railcars.pop if stop?
  end

  def pass_railcar(&block)
    @railcars.each_with_index do |railcar, index|
      block.call(railcar, index)
    end
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    unless number =~ NUMBER_FORMAT
      raise "The train number must have letters or numbers"\
      " and look like this: XXX-XX or XXXXX"
    end
  end
end
