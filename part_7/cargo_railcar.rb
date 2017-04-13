require_relative 'railcar'

class CargoRailcar < RailCar
  attr_reader :free_volume, :filled_volume

  def initialize(volume)
    @free_volume = volume.to_f
    @filled_volume = 0
    super
  end

  def fill(volume)
    raise "Available volume is - #{@free_volume}" if volume > @free_volume
    if @free_volume > 0
      @free_volume -= volume
      @filled_volume += volume
    else
      puts "Fully filled"
    end
  end
end