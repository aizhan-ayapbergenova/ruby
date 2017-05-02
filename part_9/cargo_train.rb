require_relative 'train'

class CargoTrain < Train
  @trains = {}

  class << self
    attr_reader :trains

    def find(number)
      @trains[number]
    end
  end

  def attach_railcar(railcar)
    @railcar_type = "CargoRailcar"
    super
  end
end
