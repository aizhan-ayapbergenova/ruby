require_relative 'railcar'

class CargoRailcar < RailCar
  attr_reader :free_volume, :taken_volume

  def initialize(volume)
    @free_volume = volume.to_f
    @taken_volume = 0
  end

  def fill(volume)
    raise "Available volume is - #{@free_volume}" if volume > @free_volume
    if @free_volume > 0
      @free_volume -= volume
      @taken_volume += volume
    else
      raise "Fully filled"
    end
  end
end