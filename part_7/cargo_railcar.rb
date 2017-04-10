require_relative 'railcar'

class CargoRailcar < RailCar
  attr_reader :free_volume, :taken_volume

  def initialize(volume)
    @free_volume = volume.to_f
    @taken_volume = 0
  end

  def fill(volume)
    if volume > @free_volume
      raise "Error"
    else
      @free_volume -= volume
      @taken_volume += volume
    end
  end
end