class Railcar
  attr_reader :type

  def initialize
    @type
  end
end

class PassengerRailcar < Railcar
  def type
    @type = "passenger"
  end
end

class CargoRailcar < Railcar
  def type
    @type = "cargo"
  end
end
