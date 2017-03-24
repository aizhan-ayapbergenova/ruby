class Train

  attr_reader :speed, :railcar_list, :type

  def initialize(number)
    @number = number
    @railcar_list = []
    @type
    @speed = 0
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

  def attach_railcar(railcar)
    @railcar_list << railcar if railcar.type == type && stop?
  end

  def unhook_railcar
    @railcar_list.pop if stop?
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
end

class PassengerTrain < Train
  def type
    @type = "passenger"
  end
end

class CargoTrain < Train
  def type
    @type = "cargo"
  end
end