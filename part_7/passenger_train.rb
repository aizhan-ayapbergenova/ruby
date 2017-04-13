require_relative 'train'

class PassengerTrain < Train

  def attach_railcar(railcar)
    @railcar_type = "PassengerRailcar"
    super
  end

end