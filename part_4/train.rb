class Train

  attr_reader :speed, :type, :railcar_quantity, :railcar_list

  def initialize(number, type, railcar_quantity)
    @number = number
    @type   = type
    @railcar_quantity = railcar_quantity
    @railcar_list = []
    self.speed = 0
  end

  def increase_speed
    self.speed += 10
  end

  def reset_speed
    self.speed = 0
  end

  def route=(route)
    @route = route
    @station_index = 0
  end

  def attach_railcar(railcar)
    @railcar_list << railcar
  end

  def unhook_railcar
    # @railcar_quantity -= 1 if stop? && @railcar_quantity > 0
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
    self.speed.zero?
  end

  protected

  attr_writer :speed

end

class PassengerTrain < Train

  def attach_railcar(railcar)
    super if railcar.type == "passenger"
  end

end

class CargoTrain < Train

  def attach_railcar(railcar)
    super if railcar.type == "cargo"
  end

end