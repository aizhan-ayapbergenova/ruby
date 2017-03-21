class Railcar

  attr_reader :type

  def initialize
    @type = nil
  end

end

class PassengerRailcar < Railcar

  def initialize
    @type = "passenger"
  end

end

class CargoRailcar < Railcar

  def initialize
    @type = "cargo"
  end

end